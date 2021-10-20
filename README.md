# us-covid-stats

Web dashboard app that presents COVID-19 infection and death counts by U.S. county, search interface via ZipCode. Written in Python using Flask, javascript, bootstrap CSS.

Uses the [Mulesoft COVID-19 APIs](https://www.mulesoft.com/exchange/68ef9520-24e9-4cf2-b2f5-620025690913/covid19-data-tracking-api/). Note there are some known problems with this API at time of writing. For instance, it returns no data for zipcodes in NYC (e.g. 10001, 10005).

Population data gathered from the U.S. Census Bureau [Population Estimate API](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.html).

## Building, Deploying & Running
This is a straightfoward Python Flask application which can be run in several ways including locally via python, as a Docker container, or in Google Cloud Run.

### via Python

From the root dir of the app:

`$ python app.py`

The app will be available on localhost port 8080 (e.g., `http://0.0.0.0:8080`)

### via Dockerfile

From the root dir of the app:

`$ docker build -t uscovidstats . && docker run --rm -p 8080:8080 -e PORT=8080 uscovidstats`

The app will be available on localhost port 8080 (e.g., `http://0.0.0.0:8080`)

### via Google Cloud Run (via Cloud Build)

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)

\- OR -

From the root dir of the app:

`$ gcloud builds submit . --config=cloudbuild.yaml`

The build results will provide a unique URL for the app.

### deploy with Terraform to Google Cloud Run
_Prerequisites:_ 

* The [Cloud Build](https://console.cloud.google.com/apis/api/cloudbuild.googleapis.com/), [Cloud Run](https://console.cloud.google.com/apis/api/run.googleapis.com/), and [Secret Manager](https://console.cloud.google.com/apis/api/secretmanager.googleapis.com/) APIs must be enabled, and Cloud Build must be granted permission to administrate Cloud Run (visit [Cloud Build Service account permissions](https://console.cloud.google.com/cloud-build/settings/) to grant this permission).
* A Cloud Storage bucket for Terraform state must exist, named "$PROJECT_ID-tf-state".
* The [Terraform builder image](https://github.com/GoogleCloudPlatform/cloud-builders-community/blob/master/terraform/) must be available in your project:
  * Clone the builder
  * Run `gcloud builds submit --substitutions=_TERRAFORM_VERSION="0.15.5",_TERRAFORM_VERSION_SHA256SUM="3b144499e08c245a8039027eb2b84c0495e119f57d79e8fb605864bb48897a7d"`
* The [GitHub CLI builder image](https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/github)
  * Clone and build/push
  * Configure token secret as describedin `github` builder README

## Testing geolocation in dev
Geolocation is done by IP address (using [ip-api.com](https://ip-api.com)). When testing locally, your external IP may not be reported to the app, so set the `DEV_EXT_IP` to your external IP address in your dev environment or in the Dockerfile.

## Contributing
This is my first github project so feel free to submit recommendations via PR, or shoot me a message.
This project is not affiliated or sponsored by Alphabet or Google.
