resource "aws_route53_record" "kriiishmatic" {
  count           = 4
  zone_id         = var.zone_id
  name            = "${var.instance[count.index]}.${var.domain_name}"  # can be "www" or "www.example.com."
  type            = "A"
  ttl             = 1
  records         = [aws_instance.Typo[count.index].private_ip]
  allow_overwrite = true  # for multiple IPs use a list
}
