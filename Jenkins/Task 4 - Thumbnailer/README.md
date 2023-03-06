# Advanced Java CI using Gitlab, Classic Jenkins & Artifactory
This project is a DevOps exercise that demonstrates building two separate Java projects, namely image-io-extensions and thumbnailer, using the classic Java CI topology: Gitlab-Jenkins+maven-Artifactory. It also involves improving the thumbnailer project by making it a dockerized application and releasing a new version of image-io-extensions supporting tiff to Artifactory.

# Project Overview
The project is divided into several parts, including:

- Building two separate Java projects: image-io-extensions and thumbnailer
- Creating a full "Build network" using Docker Compose with Gitlab, Jenkins, and Artifactory
- Setting up each of the servers, including Gitlab, Jenkins, and Artifactory
- Implementing two CI jobs: image-io-extensions CI should mvn deploy upon push to master and thumbnailer CI should mvn install upon push to master
- Dockerizing the thumbnailer project
- Creating a manual release job for image-io-extensions

# Usage
To use this project, follow these steps:

1. Build the image-io-extensions and thumbnailer projects using Maven.
2. Create the full "Build network" using Docker Compose with Gitlab, Jenkins, and Artifactory.
```bash
 docker compose up --build
 ```
3. Set up each of the servers, including Gitlab, Jenkins, and Artifactory.
4. Create a manual release job for image-io-extensions.
