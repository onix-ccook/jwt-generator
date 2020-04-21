#!/bin/bash

function DeployApp() {
    set -x
    gcloud app deploy app.yaml --project ${GCP_PROJECT_NAME}
    exit
}

function ListApp() {
    set -x
    gcloud app services list --filter=SERVICE:${GAE_SERVICE_NAME}
    exit
}

function BrowseApp() {
    set -x
    gcloud app browse -s ${GAE_SERVICE_NAME} --project ${GCP_PROJECT_NAME}
    exit
}

function RunApp() {
    echo ""
    echo "1. Create a virtual Python Environment - (python3 -m venv env-tgen)"
    echo "2. Activate the environment - (source env-tgen/bin/activate)"
    echo "3. Install the required packages - (pip install -r requirements.txt)"
    echo "4. Run the app - (python main.py)"
    echo "5. Connect to the app with a browser - (http://localhost:8080/)"
    echo ""
    exit
}

function RemoveApp() {
    set -x
    gcloud app services delete ${GAE_SERVICE_NAME}
    exit
}

source config.conf

[ "$1" == "-d" ]   && DeployApp
[ "$1" == "-l" ]   && ListApp
[ "$1" == "-b" ]   && BrowseApp
[ "$1" == "-r" ]   && RunApp
[ "$1" == "-del" ] && RemoveApp

cat << EOF

Usage: $0 <OPTION>

Where OPTION is ONE of:

    -r    Run app locally
    -d    Deploy app ${GAE_SERVICE_NAME} to ${GCP_PROJECT_NAME}
    -l    List app ${GAE_SERVICE_NAME} and version info
    -b    Browse app ${GAE_SERVICE_NAME} on ${GCP_PROJECT_NAME}
    -del  Delete app ${GAE_SERVICE_NAME} from ${GCP_PROJECT_NAME}

EOF