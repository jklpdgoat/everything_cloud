







output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.static_website.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.static_website.website_endpoint
}

output "website_endpoint" {
  description = "Domain name of the bucket"
  value       = module.static_website.website_endpoint
}
