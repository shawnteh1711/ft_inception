#!/bin/bash

# Wait until Mailhog is ready
until nc -z localhost 1025; do
    echo "Mailhog is not ready yet. Retrying..."
    sleep 1
done

# Send a test email using mhsendmail
echo -e "Subject: Test Email\n\nThis is a test email from mhsendmail" | /usr/local/bin/mhsendmail --smtp-addr=localhost:1025 recipient@example.com

# Run the command passed as an argument to the script
exec "$@" &