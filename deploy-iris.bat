@echo off
echo Init Docker Desktop...
start /b "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

:esperar_docker
echo Esperando a que Docker se inicie...
timeout /t 10 /nobreak >nul

:: Verificar si el servicio Docker está corriendo
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker aún no esta listo. Esperando...
    timeout /t 5 /nobreak >nul
    goto esperar_docker
)

echo Docker esta listo. Continuando...
cd /d .\iris-web

echo Construyendo los contenedores...
docker-compose build

echo Iniciando los contenedores...
docker-compose up -d

:esperar_containers
echo Verificando si los contenedores estan listos...
timeout /t 5 /nobreak >nul

:: Verificar si los contenedores están corriendo
docker ps | findstr "iris" >nul
if %errorlevel% neq 0 goto esperar_containers

echo Todos los contenedores estan listos.

:: Abrir IRIS-Web en el navegador Brave
start "" "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" "https://localhost:443"


:: Esperar a que Brave se cierre
echo Esperando a que Brave se cierre...
:esperar_brave
tasklist | findstr /I "brave.exe" >nul
if %errorlevel% == 0 (
    timeout /t 5 /nobreak >nul
    goto esperar_brave
)

:: Detener y eliminar contenedores
echo Cerrando contenedores de IRIS-Web...
docker-compose down
exit
