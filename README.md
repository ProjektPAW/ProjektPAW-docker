# ProjektPAW-docker

## Info
.ENV files contain example values for environmental variables for frontend and backend development servers.
Values for email and email password need to be changed for email verification to work.

## Starting application
To start for the first time, change directory to repository direction e.g. `cd ProjektPAW-docker` and type `docker compose up --build` in command line.
After initial start, when in repository direction type `docker compose up` to start the app.
To start in detached mode (in background) run docker compose with `-d` parameter e.g. `docker compose up -d`.

## Stopping applicatuon
To stop running app press CTRL+C when in attached mode (terminal shows logs of running containers).
To stop and demove containers type `docker compose down`.