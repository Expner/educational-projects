resource "yandex_vpc_security_group" "secure-bastion-sg" {
    name = "secure-bastion-sg"
    folder_id = var.folder-id
    network_id = "${yandex_vpc_network.external-bastion-network.id}"
    ingress {
        port = 22
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "yandex_vpc_security_group" "internal-bastion-sg" {
    name = "internal-bastion-sg"
    folder_id = var.folder-id
    network_id = "${yandex_vpc_network.internal-bastion-network.id}"
    ingress {
        port = 22
        protocol = "TCP"
        v4_cidr_blocks = [var.internal-bastion-sg-ingress-CIDR]
    }
    egress {
        port = 22
        protocol = "TCP"
        predefined_target = "self_security_group" 
    }
}