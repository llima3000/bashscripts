#!/bin/bash

cat > /usr/local/bin/disable-nic-offload.sh <<EOF
#!/bin/bash
echo "$(date) - Startup script executed" >> /var/log/mystartup.log
ethtool -K eno1 gso off gro off tso off tx off rx off rxvlan off txvlan off sg off
ethtool -a eno1
echo -------------------------------------------
EOF

chmod +x /usr/local/bin/disable-nic-offload.sh

cat > /etc/systemd/system/disable-nic-offload.service <<EOF
[Unit]
Description=Disable NIC Offload Script
After=network.target

[Service]
ExecStart=/usr/local/bin/disable-nic-offload.sh
Type=oneshot
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable disable-nic-offload.service
systemctl start disable-nic-offload.service
