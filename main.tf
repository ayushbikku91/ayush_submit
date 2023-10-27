provider "google" {
  credentials = file("<YOUR_SERVICE_ACCOUNT_KEY_FILE>")
  project     = "<YOUR_PROJECT_ID>"
  region      = "us-central1"
}

# we can define variables and modules here as needed.
