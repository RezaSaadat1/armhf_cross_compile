#!/bin/bash
DEST_IP="$1"
DEBUG_PORT="$2"
BINARY="$3"
DEST_DIR="$4"
USER="$5"
PASS="$6"

# kill gdbserver on target and delete old binary
sshpass -p ${PASS} ssh ${USER}@${DEST_IP} "sh -c 'pkill -f gdbserver; rm -rf ${DEST_DIR}/${BINARY} || exit 0'"

# send binary to target
sshpass -p ${PASS} scp ${BINARY} ${USER}@${DEST_IP}:${DEST_DIR}/${BINARY}

# start gdbserver on target
sshpass -p ${PASS} ssh -t ${USER}@${DEST_IP} "sh -c 'cd ${DEST_DIR}; gdbserver localhost:${DEBUG_PORT} ${BINARY}'"
# If you need to run the binary with root privileges, instead of above line you can uncomment the alternative command:
# sshpass -p ${PASS} ssh -t ${USER}@${DEST_IP} "cd "$DEST_DIR"; echo "$PASS" | sudo -S gdbserver localhost:$DEBUG_PORT $BINARY"