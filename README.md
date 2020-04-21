# JSON Web Token (JWT) Generator

A bit of Python code to generate a JWT. Also some scripts and config files to get it running in Google App Engine (GAE).

If you plan to deploy the app to GAE then edit the **config.conf** file and edit the variable for the GCP project.

    GCP_PROJECT_NAME="my-gcp-project"

Use the **run.sh** script to administer the project

**Usage: run.sh {OPTION}**

Where OPTION is ONE of:

- **-r** *Run app locally*
- **-d** *Deploy app to Google App Engine*
- **-l** *List app*
- **-b** *Browse app in a web browser*
- **-del** *Remove app from GAE*