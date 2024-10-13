resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = var.client_id_list

  thumbprint_list = var.thumbprint_list
}