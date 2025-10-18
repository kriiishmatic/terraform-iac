resource "aws_route53_record" "www" {
  depends_on = [aws_instance.Typo]
  for_each = aws_instance.Typo
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"  # can be "www" or "www.example.com."
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true 
}