resource "yandex_dns_recordset" "bastion-recordset" {
    zone_id = yandex_dns_zone.public-zone.id
    name = "bastion"
    type = "A"
    ttl = 200
    data = [yandex_compute_instance.bastion-host.network_interface.0.nat_ip_address]
}

resource "yandex_dns_recordset" "other-vm-recordset" {
    zone_id = yandex_dns_zone.public-zone.id
    name = "other-vm"
    type = "A"
    ttl = 200
    data = [yandex_compute_instance.compute-instance[0].network_interface.0.ip_address,
            yandex_compute_instance.compute-instance[1].network_interface.0.ip_address,
            yandex_compute_instance.compute-instance[2].network_interface.0.ip_address,
            yandex_compute_instance.compute-instance[3].network_interface.0.ip_address,
            yandex_compute_instance.compute-instance[4].network_interface.0.ip_address,
            yandex_compute_instance.compute-instance[5].network_interface.0.ip_address]
}

resource "yandex_dns_recordset" "gitlab-recordset" {
    zone_id = yandex_dns_zone.public-zone.id
    name = "gitlab"
    type = "A"
    ttl = 200
    data = [yandex_compute_instance.gitlab.network_interface.0.ip_address]
}