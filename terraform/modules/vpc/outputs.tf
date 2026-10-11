output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs (load balancers, NAT)."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs (EKS worker nodes)."
  value       = aws_subnet.private[*].id
}

output "nat_gateway_enabled" {
  description = "Whether private subnets have outbound internet via NAT."
  value       = var.enable_nat_gateway
}
