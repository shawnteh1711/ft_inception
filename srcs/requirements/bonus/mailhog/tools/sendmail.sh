# #!/bin/bash

# # Start Mailhog service
# /usr/local/bin/MailHog &

# # Wait until Mailhog is ready
# until nc -z localhost 8025; do
#     echo "Mailhog is not ready yet. Retrying..."
#     sleep 1
# done

# # Send a test email using mhsendmail
# echo -e "Subject: Test Email\n\nThis is a test emails from mhsendmail" | /usr/local/bin/mhsendmail --smtp-addr=localhost:1025 recipient@example.com

# # Run command in Dockerfile
# exec "$@"

#!/bin/bash

# Start Mailhog in the background and get its process ID
/usr/local/bin/MailHog & MAILHOG_PID=$!

# Wait until Mailhog is ready
until nc -z localhost 8025; do
    echo "Mailhog is not ready yet. Retrying..."
    sleep 1
done

# Send a test email using mhsendmail
echo -e "Subject: Test Email\n\nThis is a test email from mhsendmail" | /usr/local/bin/mhsendmail --smtp-addr=localhost:1025 recipient@example.com

# Wait until Mailhog has received the email
until curl -s http://localhost:8025/api/v2/messages | grep -q 'Test Email'; do
    echo "Test email not found in Mailhog. Retrying..."
    sleep 1
done

# Kill Mailhog and exit
kill $MAILHOG_PID