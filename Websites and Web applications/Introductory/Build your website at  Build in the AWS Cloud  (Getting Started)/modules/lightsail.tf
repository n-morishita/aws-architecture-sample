resource "aws_lightsail_instance" "main" {
  name              = "sample-web"
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = file("${path.module}/user_data/setup.sh")

  add_on {
    type          = "AutoSnapshot"
    snapshot_time = "13:00" # UTC時刻で設定
    status        = "Enabled"
  }

  tags = {
    Name = "sample-web"
  }
}


resource "aws_lightsail_instance_public_ports" "main" {
  instance_name = aws_lightsail_instance.main.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    # cidrs     = [""]
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    # cidrs     = [""]
  }

  # 証明書を作成後に有効化 
  # port_info {
  #   protocol  = "tcp"
  #   from_port = 443
  #   to_port   = 443
  #   cidrs     = [""]
  # }
}
