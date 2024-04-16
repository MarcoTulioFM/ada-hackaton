module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = ">=9.0"

  project_id   = var.projet-id
  network_name = "ada-vpc"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name   = "vpc-ada1"
      subnet_ip     = "192.168.2.0/24"
      subnet_region = "us-east1"
    }
  ]

  ingress_rules = [
    {
      name               = "ssh"
      source_ranges = ["0.0.0.0/0"]


      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
    },

    {
        name = "http"
        source_ranges = ["0.0.0.0/0"]

        allow = [
            {
                protocol = "tcp"
                ports = ["80", "443"]
            }
        ]
    }
  ]
}