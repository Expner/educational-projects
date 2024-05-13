resource "yandex_dns_recordset" "bastion-recordset" {
    zone_id = yandex_dns_zone.public-zone.id
    name = "bastion"
    type = "A"
    ttl = 200
    data = [yandex_compute_instance.bastion-host.network_interface.0.nat_ip_address]
}

resource "yandex_dns_recordset" "other-vm-recordset" {
    for_each = tomap({
        vm-0 = yandex_compute_instance.compute-instance[0].network_interface.0.ip_address
        vm-1 = yandex_compute_instance.compute-instance[1].network_interface.0.ip_address
        vm-2 = yandex_compute_instance.compute-instance[2].network_interface.0.ip_address
        vm-3 = yandex_compute_instance.compute-instance[3].network_interface.0.ip_address
        vm-4 = yandex_compute_instance.compute-instance[4].network_interface.0.ip_address
        vm-5 = yandex_compute_instance.compute-instance[5].network_interface.0.ip_address
        })
    zone_id = yandex_dns_zone.private-zone.id
    name = "${each.key}"
    type = "A"
    ttl = 200
    data = [each.value]
    depends_on = [ yandex_compute_instance.compute-instance ]
}

resource "yandex_dns_recordset" "gitlab-recordset" {
    zone_id = yandex_dns_zone.public-zone.id
    name = "gitlab"
    type = "A"
    ttl = 200
    data = [yandex_compute_instance.gitlab.network_interface.0.ip_address]
}