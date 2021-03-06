provider "consul" {
    datacenter = "${var.env}"
    address = "consul.service.canary.sh"
}

resource "consul_catalog_entry" "dcos_master" {
    datacenter = "${var.env}"
    address = "${aws_elb.internal_master.dns_name}"
    node = "catalog-dcos-master"
    service = {
        name = "dcos"
    }
}

resource "consul_catalog_entry" "dcos_public" {
    datacenter = "${var.env}"
    address = "${aws_elb.public_slaves.dns_name}"
    node = "catalog-dcos-public"
    service = {
        name = "dcos-public"
    }
}

resource "consul_catalog_entry" "dcos_private" {
    datacenter = "${var.env}"
    address = "${aws_elb.slaves.dns_name}"
    node = "catalog-dcos-private"
    service = {
        name = "dcos-private"
    }
}

resource "consul_catalog_entry" "dcos_example_nginx_external" {
    datacenter = "${var.env}"
    address = "${aws_elb.public_slaves.dns_name}"
    node = "catalog-dcos-examle-nginx-external"
    service = {
        name = "example-nginx"
        tags = ["external"]
        port = 80
    }
}

resource "consul_catalog_entry" "dcos_example_nginx_internal" {
    datacenter = "${var.env}"
    address = "marathon-lb-internal.service.${var.env}.canary.sh"
    node = "catalog-dcos-example-nginx-internal"
    service = {
        name = "example-nginx"
        tags = ["internal"]
        port = 80
    }
}

resource "consul_catalog_entry" "dcos_example_ce_panel_internal" {
    datacenter = "${var.env}"
    address = "marathon-lb-internal.service.${var.env}.canary.sh"
    node = "catalog-dcos-ce-panel"
    service = {
        name = "ce-panel"
        tags = ["internal"]
        port = 80
    }
}

resource "consul_catalog_entry" "dcos_broadcaster_subscriber" {
    datacenter = "${var.env}"
    address = "${aws_elb.public_slaves.dns_name}"
    node = "catalog-dcos-watch-live-broadcaster-subscriber"
    service = {
        name = "watch-live-broadcaster-subscriber"
        port = 443
    }
}

resource "consul_catalog_entry" "dcos_broadcaster_producer" {
    datacenter = "${var.env}"
    address = "${aws_elb.public_slaves.dns_name}"
    node = "catalog-dcos-watch-live-broadcaster-producer"
    service = {
        name = "watch-live-broadcaster-producer"
        port = 443
    }
}


resource "consul_catalog_entry" "dcos_wras_api" {
    datacenter = "${var.env}"
    address = "${aws_elb.slaves.dns_name}"
    node = "catalog-dcos-wras-api"
    service = {
        name = "dcos-wras-api"
        port = 80
    }
}

resource "consul_catalog_entry" "dcos_watch_live_negotiator" {
    datacenter = "${var.env}"
    address = "${aws_elb.slaves.dns_name}"
    node = "catalog-watch-live-negotiator"
    service = {
        name = "dcos-watch-live-negotiator"
        port = 80
    }
}
