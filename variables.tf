variable "key-name" {

}

variable "network-security-group-name" {

}

variable "debian-ami" {

}

variable "debian-instance-type" {

}

variable "aws_access_key" {
  description = "The AWS access key for authentication"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key for authentication"
  type        = string
}
