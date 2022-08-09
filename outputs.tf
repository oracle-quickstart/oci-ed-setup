## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "generated_smtp_password" {
  count = var.generate_smtp_credentials ? 1 : 0
  value     = oci_identity_smtp_credential.smtp_credential.password
  sensitive = true
}

output "generated_smtp_username" {
  count = var.generate_smtp_credentials ? 1 : 0
  value     = oci_identity_smtp_credential.smtp_credential.username
  sensitive = true
}

output "generated_dkim_txt_record" {
  count = var.generate_dkim ? 1 : 0
  value     = oci_email_dkim.dkim.txt_record_value
  sensitive = false
}

output "generated_dkim_cname_record" {
  count = var.generate_dkim ? 1 : 0
  value     = oci_email_dkim.dkim.cname_record_value
  sensitive = false
}