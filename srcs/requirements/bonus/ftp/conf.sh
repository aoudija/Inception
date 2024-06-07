mkdir -p /var/run/vsftpd/empty

echo '
listen=YES
# listen_port=21
listen_address=0.0.0.0
secure_chroot_dir=/var/run/vsftpd/empty' > /etc/vsftpd.conf

vsftpd
