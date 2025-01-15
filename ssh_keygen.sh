#!/bin/bash

generate_ssh_key() {
  echo "Generating SSH key for $(whoami)"

  if ssh-keygen -t rsa -f ~/.ssh/$(whoami)_id_rsa -N ""; then
    echo "SSH key generated successfully for $(whoami)"
  else
    echo "SSH key generation failed"
  fi
}

generate_ssh_key
