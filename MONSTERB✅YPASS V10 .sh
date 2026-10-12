#!/system/bin/sh


CURRENT_TIME=$(date +%s)

# समय सीमा की जाँच
if [ $CURRENT_TIME -gt $EXPIRY_TIME ]; then
    echo "स्क्रिप्ट का समय समाप्त (Expired) हो गया है।"
    
    # एक्सपायर होने पर टेलीग्राम चैनल खुलेगा
    am start -a android.intent.action.VIEW -d "https://t.me/P20MONSTER" >/dev/null 2>&1
    
    exit 1
fi

# === Config ===
CORRECT_KEY="VIJAYFF07"

# === Key Verification Block ===
verify_key() {
    echo -n "Enter your access key: "
    read USER_INPUT

    if [ "$USER_INPUT" = "$CORRECT_KEY" ]; then
        echo "[✓] Access granted."
    else
        echo "[X] Access Denied"
        exit 1
    fi
}

# Run function
verify_key

# ==========================================
#  P20 MONSTER: FREE FIRE ANTI-CHEAT BYPASS
#  BY: SEGAR (VERSION ULTRA AMÉLIORÉE)
#  VERSION: 2.0
# ==========================================

clear
echo "=========================================="
echo "    FREE FIRE BYPASS BY: SEGAR            "
echo "=========================================="

# === Configuration ===
DNSMASQ_CONF="/data/local/tmp/dnsmasq.conf"
FAKE_HTTP_DIR="/data/local/www"
FAKE_HTTP_PORT=8888
PIDFILE="/data/local/tmp/dnsmasq.pid"
LOGFILE="/data/local/tmp/bypass.log"

# === Chemins de l'Anti-Cheat et des Rapports ===
GAME_STORAGE="/storage/emulated/0/Android/data/com.dts.freefireth"
ACE_DIR="/data/data/com.dts.freefireth/files/ace"
TENCENT_DIR="/data/data/com.dts.freefireth/files/tencent"

echo "[+] Configuration des dossiers..."
mkdir -p "$(dirname "$DNSMASQ_CONF")" "$FAKE_HTTP_DIR" /data/local/tmp/run

# === Code de Masquage Avancé de l'Anti-Cheat ===
echo "[*] Masquage avancé de l'Anti-Cheat activé..."

# 1. Nettoyage et blocage des rapports de crash et logs
rm -rf "$GAME_STORAGE/files/GarenaExperience" 2>/dev/null
rm -rf "$GAME_STORAGE/files/report" 2>/dev/null
mkdir -p "$GAME_STORAGE/files/GarenaExperience" "$GAME_STORAGE/files/report"
chmod 000 "$GAME_STORAGE/files/GarenaExperience" "$GAME_STORAGE/files/report"

# 2. Leurre et gel des dossiers de sécurité Tencent ACE du jeu
if [ -d "$ACE_DIR" ] || [ -d "$TENCENT_DIR" ]; then
    rm -rf "$ACE_DIR"/* "$TENCENT_DIR"/* 2>/dev/null
    chown -R root:root "$ACE_DIR" "$TENCENT_DIR" 2>/dev/null
    chmod -R 000 "$ACE_DIR" "$TENCENT_DIR" 2>/dev/null
fi

# === Génération de la configuration de blocage ===
cat <<EOF > "$DNSMASQ_CONF"
# === Domaines Bloqués ===
# Systèmes Anti-Cheat
address=/://anticheatexpert.com
address=/://anticheatexpert.com
address=/://anticheatexpert.com
address=/://anticheatexpert.com

# Traçage Firebase
address=/://crashlytics.com
address=/://googleapis.com
address=/://googleapis.com

# Vérification Connectivité Google
address=/://gstatic.com

# Bugly
address=/://qq.com
address=/://qq.com

# AppsFlyer
address=/://appsflyer.com

# Serveurs Centraux Garena / Free Fire
address=/://garenanow.com
address=/://freefiremobile.com
address=/://garenanow.com
address=/ff.rtc.grtc.garenanow.vn/127.0.0.1

# Serveurs de Téléchargement
address=/://freefiremobile.com

# Rapports + Authentification
address=/://garena.com
address=/://garena.com

# Divers
address=/://example.com
EOF

# === Fermeture des instances précédentes ===
{
  echo "[*] Nettoyage des sessions précédentes..."
  pkill -f dnsmasq
  pkill -f httpd
  iptables -t nat -D OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53 2>/dev/null
} >> "$LOGFILE" 2>&1

# === Lancement de dnsmasq ===
echo "[*] Lancement de dnsmasq..." >> "$LOGFILE"
dnsmasq --no-resolv --no-hosts \
  --conf-file="$DNSMASQ_CONF" \
  --pid-file="$PIDFILE" \
  --keep-in-foreground >> "$LOGFILE" 2>&1 &

DNSMASQ_PID=$!
sleep 1

# === Redirection DNS ===
iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53

# === Lancement du faux serveur HTTP ===
echo "OK" > "$FAKE_HTTP_DIR/index.html"
busybox httpd -p "$FAKE_HTTP_PORT" -h "$FAKE_HTTP_DIR"

# === Informations Finales ===
echo "[✓] Redirection DNS active. PID de dnsmasq : $DNSMASQ_PID"
echo "[✓] Fichier de log : $LOGFILE"
echo "[!] Gardez MT Manager ouvert pour éviter la fermeture."
echo "[•] Script en veille pour rester actif..."
echo ""
echo "=========================================="
echo "    BYPASS ACTIVATED SUCCESSFULLY BY SEGAR "
echo "=========================================="

# === Maintien en vie ===
sleep 86400
Il2CppGetMethodOffset(OBFUSCATE("Assembly-CSharp.dll"), OBFUSCATE("COW"), OBFUSCATE("UIModelLogin"), OBFUSCATE("CreateLoginReqInfoData"), 1)

void (*original_CreateLoginReq)(void*, void**);
void Hook_CreateLoginReq(void* _this, void** reqPtr) {
    original_CreateLoginReq(_this, reqPtr);
    
    if (!reqPtr || !*reqPtr) return;

    void* req = *reqPtr;

    
    void* verStr = *(void**)((uintptr_t)req + 0x24);
    if (verStr) {
        Il2CppString* s = (Il2CppString*)verStr;
        int32_t len = s->length;
        if (len < 0) len = 0;                 
        if (len > 64) len = 64;               
        uint16_t* chars = (uint16_t*)((uintptr_t)s + 0x0C); 

        int dot1 = -1, dot2 = -1;
        for (int32_t i = 0; i < len; i++) {
            if (chars[i] == '.') {
                if (dot1 == -1) dot1 = i;
                else { dot2 = i; break; }
            }
        }
        if (dot1 >= 0 && dot2 > dot1 + 1 && dot2 < len) {
            int newVal = 126;
            int32_t pos = dot2 - 1;
            do {
                chars[pos--] = '0' + (newVal % 10);
                newVal /= 10;
            } while (newVal > 0 && pos > dot1);
            while (pos > dot1) chars[pos--] = '0';
        }
    }
}
DobbyHook((void*)OFFSET_By_Cxlxstical, (void*)Hook_CreateLoginReq, (void**)&original_CreateLoginReq)