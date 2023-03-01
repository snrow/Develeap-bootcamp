# Lavagna Project
This project is based on https://github.com/digitalfondue/lavagna and is intended to be run as Docker containers using docker-compose.

# Prerequisites
Before starting, ensure that you have the following installed on your machine:

- Docker
- Docker Compose

# Build and Run
1. Clone the repository.

2. Build the Docker image + nginx and MYSQL data base for Lavagna with the following command:

```bash
bash init.sh
```

3. Access the Lavagna application by visiting http://localhost:80 in your web browser.

# Additional Notes
- Lavagna is configured to use a MySQL database. You can change the database settings by editing the docker-compose.yml file.

- By default, Lavagna uses a file-based HSQLDB. To switch to MySQL, you need to change the hibernate.cfg.xml file in the lavagna directory.

- If you want to run Lavagna without Docker, you can follow the instructions in the project/README.md file.

That's it! With these instructions, you should be able to build and run Lavagna with Docker.