## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_email_email_domain" "domain" {
    compartment_id = var.compartment_ocid
    name = var.email_domain_name
}

resource "oci_email_dkim" "dkim" {
    count = var.generate_dkim ? 1 : 0
    email_domain_id = oci_email_email_domain.domain.id
}

resource "oci_email_sender" "sender" {
    compartment_id = var.compartment_ocid
    email_address = var.sender_email_address
}

resource "oci_identity_smtp_credential" "smtp_credential" {
    provider = oci.homeregion
    description = var.smtp_credential_description
    user_id = var.current_user_ocid
}