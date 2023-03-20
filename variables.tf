variable "create_iam_service_linked_role" {
  description = "Whether to create the AWSServiceRoleForAmazonElasticsearchService role used by the OpenSearch service"
  type        = bool
  default     = true
}