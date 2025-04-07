# 🚀 IRIS-Web Startup Script

This repository includes a batch script that automates the setup and shutdown process of the **DFIR-IRIS web application** using Docker.

## 📂 File Structure Requirement

**Important:** The batch file **must be placed one level above** the `iris-web` folder.  
This is because the script contains the command:

`cd /d .\iris-web`

If the script is placed *inside* the `iris-web` folder, the path will break and the script won't work as intended.

**Example folder structure:**

```
your-project-folder/
├── iris-web/
│   ├── docker-compose.yml
│   └── other project files...
└── start-iris.bat   ← The script must be here
```

## ⚙️ What the Script Does

1. Starts Docker Desktop if it's not already running.  
2. Waits until Docker is fully initialized.  
3. Changes directory into `iris-web`.  
4. Builds the Docker containers using `docker-compose build`.  
5. Starts the containers with `docker-compose up -d`.  
6. Waits for the containers (specifically the IRIS service) to be up and running.  
7. Opens the IRIS web interface in **Brave** browser at `https://localhost:443`.  
8. Waits until the user closes Brave.  
9. Stops and removes all running containers (`docker-compose down`).

## 🖥️ Requirements

- Docker Desktop installed at:  
  `C:\Program Files\Docker\Docker\Docker Desktop.exe`

- Brave Browser installed at:  
  `C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe`

- `docker-compose` available in your system PATH

**Make sure to adjust the script if you use different installation paths or a different browser.**

## 📌 Tip

You can create a shortcut to this script on your desktop for quick access.  
Right-click → "Create Shortcut" → Optional: "Run as Administrator".
