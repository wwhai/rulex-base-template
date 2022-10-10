#! /bin/bash
set -e
INSTALL_PATH=/usr/local/rulexapp
APP_NAME=rulex-gateway

if [ ! -d "${INSTALL_PATH}" ]; then
    mkdir -p ${INSTALL_PATH}
else
    rm -rf ${INSTALL_PATH}
    mkdir -p ${INSTALL_PATH}
fi
cp ./${APP_NAME} ${INSTALL_PATH}
cat >./${APP_NAME}.service <<-EOF
[Unit]
Description=${APP_NAME}
After=network-online.target rc-local.service nss-user-lookup.target
Wants=network-online.target

[Service]
User=root
Type=simple
WorkingDirectory=${INSTALL_PATH}
ExecStart=${INSTALL_PATH}/${APP_NAME}

[Install]
WantedBy=multi-user.target
EOF
echo "--------------------------------------------------"
echo ">> ${APP_NAME} installed successfully!!! "
echo ">> systemctl command list: "
echo "* sudo systemctl start ${APP_NAME}"
echo "* sudo systemctl enable ${APP_NAME}"
echo "* sudo systemctl status ${APP_NAME}"
echo "* journalctl -u ${APP_NAME}"
echo "--------------------------------------------------"
