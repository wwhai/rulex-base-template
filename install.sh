#! /bin/bash
set -e
INSTALL_PATH=/usr/local/rulexapp
APP_NAME=yk8-gateway

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
[Service]
User=root
WorkingDirectory=${INSTALL_PATH}/${APP_NAME}
TimeoutStartSec=5
ExecStart=./${APP_NAME}
ExecStop=echo "${APP_NAME} stop."
[Install]
WantedBy=multi-user.target
EOF
echo "--------------------------------------------------"
echo ">> ${APP_NAME} installed successfully!!! "
echo ">> systemctl command list: "
echo "* sudo systemctl start ${APP_NAME}"
echo "* sudo systemctl enable ${APP_NAME}"
echo "* sudo systemctl status ${APP_NAME}"
echo "--------------------------------------------------"
