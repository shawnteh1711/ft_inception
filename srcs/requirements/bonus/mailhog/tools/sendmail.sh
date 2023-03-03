#!/bin/bash

# Start Mailhog service
MailHog &

# Wait until Mailhog is ready
until nc -z localhost 8025; do
    echo "Mailhog is not ready yet. Retrying..."
    sleep 1
done

# Send a test email using mhsendmail
echo -e "Subject: Test Email\n\nThis is a test emails from mhsendmail" | /usr/local/bin/mhsendmail --smtp-addr=localhost:1025 recipient@example.com

# Run command in Dockerfile
# exec "$@"
