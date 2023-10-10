#!/usr/bin/env bash
set -e

echo "Activating feature 'foundryvtt'"

URL=${URL:-undefined}
echo "The provided url is: $URL"

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

# The rest of this largely follows FoundryVTT's Installation Guide
# See: https://foundryvtt.com/article/installation/

# Save download to a temporary file for inspection in the event the download fails
DIR=$(mktemp -d /tmp/foundry.XXXXXXXX)

echo "Downloading $URL"
curl -s $URL > $DIR/foundry.zip
echo "Saved to $DIR/foundry.zip"

echo "Extracting and installing FoundryVTT"
unzip $DIR/foundry.zip -d $DIR/foundryvtt

echo "Installing FoundryVTT at /usr/local/bin/foundryvtt"
install --target-directory="$DIR/foundryvtt" --mode="0755" /usr/local/bin/foundryvtt

echo "Cleaning up, removing $DIR"
rm -fdr $DIR

echo "FoundryVTT installation complete"

## Consider removing or running a different way
echo "Installing FoundryVTT runtime OS dependencies"
sudo apt install libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libgtk-3-0 libgbm1 libasound2
