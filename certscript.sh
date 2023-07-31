#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_root_certificate>"
    exit 1
fi

# Extract the input parameter (path to the root certificate)
root_cert_path="$1"

# Check if the certificate file exists
if [ ! -f "$root_cert_path" ]; then
    echo "Error: Root certificate file not found at $root_cert_path"
    exit 1
fi

# Determine the path to the system-wide CA certificates directory
ca_cert_dir="/etc/ssl/certs"

# Backup the original ca-certificates.crt file
sudo cp "$ca_cert_dir/ca-certificates.crt" "$ca_cert_dir/ca-certificates.crt.backup"

# Append the contents of the root certificate to ca-certificates.crt
sudo cat "$root_cert_path" >> "$ca_cert_dir/ca-certificates.crt"

echo "Root certificate imported successfully!"

