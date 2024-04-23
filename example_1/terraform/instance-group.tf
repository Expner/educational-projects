# resource "yandex_compute_instance_group" "instance-group" {
#   name = "instance-group"
#   folder_id = var.folder-id
#   service_account_id = "${yandex_iam_service_account.lab-sa.id}"

#   deploy_policy {
#     max_unavailable = 2
#     max_expansion = 2
#   }

#   instance_template {
#     boot_disk {
#       name = "lab-group-disk"
#       initialize_params {
#         image_id = var.image-id
#       }
#     }
#     resources {
#       memory = 2
#       cores = 2
#       core_fraction = 20
#     }

#     network_interface {
#       subnet_ids = ["${yandex_vpc_subnet.internal-bastion-segment.id}"]
#     }
#   }

#   allocation_policy {
#     zones = ["ru-central1-a"]
#   }

#   scale_policy {
#     auto_scale {
#       initial_size = 6
#       measurement_duration = 60
#       cpu_utilization_target = 50
#       warmup_duration = 180
#     }
#   }
# }
