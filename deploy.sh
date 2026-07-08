#!/bin/bash
# ─────────────────────────────────────────────
# Home Works Now — GoDaddy Deploy Script
# Run: bash deploy.sh
# Requires: lftp  (install: brew install lftp)
# ─────────────────────────────────────────────

FTP_HOST="ftp.homeworksnow.com"
FTP_USER="your-cpanel-username"
FTP_PASS="your-cpanel-password"
REMOTE_DIR="/public_html"
LOCAL_DIR="/Users/h2o-northshore/HOME WORKS"

echo "Deploying to GoDaddy..."

lftp -c "
set ftp:ssl-allow no;
open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST;
mirror --reverse --delete --verbose \
  --exclude .git/ \
  --exclude .DS_Store \
  --exclude deploy.sh \
  --exclude '*.zip' \
  --exclude __pycache__/ \
  '$LOCAL_DIR' $REMOTE_DIR;
bye
"

echo "Deploy complete."
