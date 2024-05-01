resource "yandex_compute_instance" "compute-instance" {
  description = each.key
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.image-id
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal-bastion-segment.id}"
    security_group_ids = ["${yandex_vpc_security_group.internal-bastion-sg.id}"]
  }

  for_each = toset(["ssh-key0.pub",
                    "ssh-key1.pub",
                    "ssh-key2.pub",
                    "ssh-key3.pub",
                    "ssh-key4.pub",
                    "ssh-key5.pub" ])
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/${each.key}")}"
  }
}
