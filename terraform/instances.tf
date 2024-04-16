resource "google_compute_instance" "hackaton" {

  name         = "teste"
  machine_type = "e2-standard-2"
  zone         = "us-east1-b"

  depends_on = [ module.vpc ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "ada-vpc"
    subnetwork = "vpc-ada1"

    access_config {
      
    }
  }

  metadata = {
    ssh-keys = "zezepopo:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = "sudo apt update; sudo apt install git -y; sudo apt install docker.io -y && sudo docker run -d -p 80:8000 marcotfm/zoologico-ada:latest"
}