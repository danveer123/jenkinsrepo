#!/bin/bash

# This is a simple script that uses a here document
# to send a message to everyone currently logged in

# Find all users currently logged in
users=$(who | awk '{print $1}')

# Loop through each user and send them a message
for user in $users; do
  # Use a here document to send the message
  message=$(cat << EOF
Hello $user,
This is a message sent to everyone currently logged in.
EOF
)

  # Use the `write` command to send the message to the user
  echo "$message" | write $user
done
