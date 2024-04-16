terraform {
  required_version = ">=1.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.24.0"
    }
  }

  backend "gcs" {
    bucket = "hackaton-ada"
    prefix = "vpc-ada/"
  }
}

provider "google" {
  region  = "us-east1"
  project = var.projet-id
}