#!/bin/bash
cd downloader
echo 170301 | sudo -kS rm config.bash~ mc-installer.bash~ mc-uninstall.bash~ gitignore~ log err commit-downloader.bash~
git add .
