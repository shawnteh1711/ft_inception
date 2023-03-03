#!/bin/bash

# Wait until Mailhog is ready
until nc -z localhost 8025; do
    sleep 1
done

# Send a test email using mhsendmail
echo -e "Subject: Test Email\n\nThis is a test email from mhsendmail" | /usr/local/bin/mhsendmail --smtp-addr=localhost:8025 recipient@example.com

# Run the command passed as an argument to the script
exec "$@"