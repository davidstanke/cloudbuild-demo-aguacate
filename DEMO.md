### These are terse instructions for how to use this repo to demo Terraform-on-CloudBuild.
(TODO: de-terse-ify these)

1. Show the running application at https://us-covid-stats.stanke.dev
2. App change:
  * Make a branch called `app-change`.
  * Modify code in the `/app` folder.
  * Make a PR against `main`
  * Observe that Cloud Build will deploy a preview version to Cloud Run and post the link to the PR
  * Merge.
3. Infra change:
  * Make a branch called `infra-change`.
  * Make a change to `main.tf` (you can modify the env var `CUSTOM_VAR` as a small and non-destructive change)
  * Make a PR against `main`
  * Observe that Cloud Build will post a description of the terraform changes to the PR
  * Merge.
4. Observe that Cloud Build deploys all commits to `main` as live revisions -- refresh us-covid-stats.stanke.dev to see
5. Throughout, show the Cloud Build configs, the TF files, the Trigger UI, the build history.

