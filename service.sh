#!/bin/bash

# E-posta ayarları
SMTP_SERVER=""
SMTP_PORT=25
FROM_EMAIL=""
TO_EMAIL=""
SUBJECT="Service Alert"
BODY_TEMPLATE="Service {service} is {status}. {action}."

# Fonksiyon: E-posta gönderme
send_email() {
    local service=$1
    local status=$2
    local action=$3

    local body=$(echo -e "Subject:$SUBJECT\n\n$BODY_TEMPLATE" | sed -e "s/{service}/$service/" -e "s/{status}/$status/" -e "s/{action}/$action/")
    
    echo -e "$body" | sendmail -f $FROM_EMAIL $TO_EMAIL
    echo "Email sent successfully"
}

# Fonksiyon: Servis durumunu kontrol et
check_service() {
    local service=$1
    local status=$(systemctl is-active --quiet $service && echo "active" || echo "inactive")

    if [ "$status" != "active" ]; then
        restart_service $service
        send_email $service $status "Restarted"
    fi
}


# İzlemek istediğiniz servislerin listesi
SERVICE_NAMES=("mysql" "dovecot" "lsws")

# Ana döngü: Her 10 saniyede bir servis durumlarını kontrol et
while true; do
    for service in "${SERVICE_NAMES[@]}"; do
        check_service $service
    done
    sleep 10  # 10 saniye bekle, sonra tekrar kontrol et
done
