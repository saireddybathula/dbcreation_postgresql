provider "google" {
  // Provide your project ID and region here
  project = "tool-evaluation-407900"
  region  = "asia-south1"
  credentials = "${file("credentials.json")}"
}
