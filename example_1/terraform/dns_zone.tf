resource "yandex_dns_zone" "public-zone" {
    name = "public-zone"
    folder_id = var.folder-id
    zone = "public.com."
    public = true
    deletion_protection = true
}

resource "yandex_dns_zone" "private-zone" {
    name = "private-zone"
    folder_id = var.folder-id
    zone = "private.com."
    public = false
    private_networks = [yandex_vpc_network.internal-bastion-network.id]

    deletion_protection = true
}