# Service Monitoring and Alert Script

Bu script, belirtilen sistem servislerinin durumunu izler ve bir servis durduğunda otomatik olarak yeniden başlatır. Ayrıca, servis durumlarıyla ilgili bildirim e-postaları gönderir.

## Kullanım

1. **Gereksinimler**
   - Bu script'in çalışması için `sendmail` komutunun kurulu olması gerekmektedir.

2. **Yükleme**
   - Script'i indirin:
     ```bash
     git clone https://github.com/ugurcomptech/Service-Monitoring-Script
     cd Service-Monitoring-Script
     ```

3. **Yapılandırma**
   - `service.sh` dosyasını düzenleyerek e-posta ayarlarınızı yapın:
     ```bash
     SMTP_SERVER=""
     SMTP_PORT=25
     FROM_EMAIL=""
     TO_EMAIL=""
     SUBJECT="Service Alert"
     BODY_TEMPLATE="Service {service} is {status}. {action}."
     ```

4. **Servislerin Tanımlanması**
   - `SERVICE_NAMES` dizisine izlemek istediğiniz servisleri ekleyin:
     ```bash
     SERVICE_NAMES=("mysql" "dovecot" "lsws")
     ```

5. **Çalıştırma**
   - Script'i başlatmak için terminalde aşağıdaki komutu kullanın:
     ```bash
     ./service.sh
     ```

6. **Bildirimler**
   - Script, bir servisin durduğunda veya yeniden başlatıldığında belirtilen e-posta adresine bildirim gönderir.

## Notlar

- Script, belirtilen servislerin durumunu her 10 saniyede bir kontrol eder ve varsa yeniden başlatır.
- Eğer bir servis durduğunda bildirim almak istemiyorsanız, `send_email` fonksiyonunu düzenleyebilir veya devre dışı bırakabilirsiniz.

## Lisans

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Bu projeyi [MIT Lisansı](https://opensource.org/licenses/MIT) altında lisansladık. Lisansın tam açıklamasını burada bulabilirsiniz.
