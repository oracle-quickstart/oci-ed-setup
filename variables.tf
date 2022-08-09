## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "current_user_ocid" {}
# variable "fingerprint" {}
# variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

variable "email_domain_name" {}
variable "sender_email_address" {}

variable "generate_smtp_credentials"{
  default = false
}

variable "generate_dkim"{
  default = false
}

variable "smtp_credential_description" {
  default = "For Demo purpose"
}

data "oci_identity_regions" "oci_regions" {

  filter {
    name   = "name"
    values = [var.region]
  }

}

