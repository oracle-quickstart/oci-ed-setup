## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "generated_smtp_password" {
  depends_on = [ oci_identity_smtp_credential.smtp_credential[0]]
  value     = oci_identity_smtp_credential.smtp_credential[0].password
  sensitive = true
}

output "generated_smtp_username" {
  depends_on = [ oci_identity_smtp_credential.smtp_credential[0]]
  value     = oci_identity_smtp_credential.smtp_credential[0].username
  sensitive = true
}

output "generated_dkim_txt_record" {
  depends_on = [ oci_email_dkim.dkim[0]]
  value     = oci_email_dkim.dkim[0].txt_record_value
  sensitive = false
}

output "generated_dkim_cname_record" {
  depends_on = [ oci_email_dkim.dkim[0]]
  value     = oci_email_dkim.dkim[0].cname_record_value
  sensitive = false
}