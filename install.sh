# ==============================================
#      8-in-1 BOYSUPOTPH - NO KEY (ULTIMATE)
# ==============================================

# 1. SETUP DIRECTORY
cd ~ && rm -rf boysupotph && mkdir boysupotph && cd boysupotph

# 2. CREATE SERVER.JS (MULTI-PROTOCOL PROXY)
cat > server.js <<'EOF'
const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');
const { spawn } = require('child_process');
const app = express();

app.use(express.static('public'));

// Proxy Routes para sa bawat Protocol
app.use('/vless', createProxyMiddleware({ target: 'http://127.0.0.1:8081', ws: true }));
app.use('/vmess', createProxyMiddleware({ target: 'http://127.0.0.1:8082', ws: true }));
app.use('/trojan', createProxyMiddleware({ target: 'http://127.0.0.1:8083', ws: true }));
app.use('/ss', createProxyMiddleware({ target: 'http://127.0.0.1:8084', ws: true }));

spawn('/usr/bin/xray', ['run', '-c', '/app/config.json']);
app.listen(process.env.PORT || 8080);
EOF
sed -n '1,80p' server.js


# 3. CREATE XRAY CONFIG (VLESS + VMESS + TROJAN + SS)
cat > config.json <<'EOF'
{
    "inbounds": [
        {
            "port": 8081, "listen": "127.0.0.1", "protocol": "vless",
            "settings": { "clients": [{"id": "550e8400-e29b-41d4-a716-446655440000"}], "decryption": "none" },
            "streamSettings": { "network": "ws", "wsSettings": {"path": "/vless"} }
        },
        {
            "port": 8082, "listen": "127.0.0.1", "protocol": "vmess",
            "settings": { "clients": [{"id": "550e8400-e29b-41d4-a716-446655440000"}] },
            "streamSettings": { "network": "ws", "wsSettings": {"path": "/vmess"} }
        },
        {
            "port": 8083, "listen": "127.0.0.1", "protocol": "trojan",
            "settings": { "clients": [{"password": "BOYSUPOT_Pass_123"}] },
            "streamSettings": { "network": "ws", "wsSettings": {"path": "/trojan"} }
        },
        {
            "port": 8084, "listen": "127.0.0.1", "protocol": "shadowsocks",
            "settings": { "method": "aes-128-gcm", "password": "BOYSUPOT_Pass_123" },
            "streamSettings": { "network": "ws", "wsSettings": {"path": "/ss"} }
        }
    ],
    "outbounds": [{"protocol": "freedom"}]
}
EOF
sed -n '1,80p' config.json


# 4. CREATE CYBER-GLASS UI (DIRECT ACCESS - NO KEY)
mkdir -p public
cat > public/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>8-in-1 BOYSUPOTPH</title>
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root { --neon: #00f2ff; --neon-v: #bc13fe; --bg: #050508; }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background: var(--bg); color: white; font-family: 'Rajdhani', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-image: radial-gradient(circle at 50% -20%, #221144 0%, transparent 50%); }
        .container { width: 95%; max-width: 420px; background: rgba(255, 255, 255, 0.03); backdrop-filter: blur(15px); border: 1px solid rgba(255, 255, 255, 0.1); padding: 40px 25px; border-radius: 30px; text-align: center; }
        .logo-box { width: 70px; height: 70px; margin: 0 auto 15px; background: linear-gradient(45deg, var(--neon), var(--neon-v)); border-radius: 20px; display: flex; align-items: center; justify-content: center; font-size: 35px; box-shadow: 0 0 25px rgba(188, 19, 254, 0.4); }
        h1 { font-size: 30px; font-weight: 700; letter-spacing: 2px; margin-bottom: 25px; text-transform: uppercase; }
        .grid { display: grid; grid-template-columns: 1fr; gap: 10px; margin-bottom: 20px; }
        .btn-gen { width: 100%; padding: 15px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 12px; color: #fff; font-weight: 700; cursor: pointer; transition: 0.3s; font-family: 'Rajdhani'; font-size: 16px; }
.btn-gen:hover { border-color: var(--neon); background: rgba(0, 242, 255, 0.1); color: var(--neon); transform: scale(1.02); }
        .res-area { margin-top: 15px; padding: 15px; background: #000; border-radius: 12px; border: 1px solid var(--neon-v); display: none; font-size: 11px; text-align: left; word-break: break-all; color: #00ff88; }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo-box">⚡️</div>
        <h1>BOYSUPOTPH</h1>
        <div class="grid">
            <button class="btn-gen" onclick="g('vless')">VLESS CONFIG</button>
            <button class="btn-gen" onclick="g('vmess')">VMESS CONFIG</button>
            <button class="btn-gen" onclick="g('trojan')">TROJAN CONFIG</button>
            <button class="btn-gen" onclick="g('ss')">SHADOWSOCKS CONFIG</button>
        </div>
        <div id="result" class="res-area"></div>
    </div>
    <script>
        function g(type) {
            const sni = "www.mayabank.ph";
            const addr = "google.com";
            const h = window.location.hostname;
            const uuid = "550e8400-e29b-41d4-a716-446655440000";
            let link = "";
            if(type==='vless') link = "vless://"+uuid+"@"+addr+":443?encryption=none&security=tls&sni="+sni+"&type=ws&host="+h+"&path=/vless#BOYSUPOT-VLESS";
            if(type==='vmess') {
                const v = { "v": "2", "ps": "BOYSUPOT-VMESS", "add": addr, "port": "443", "id": uuid, "aid": "0", "net": "ws", "path": "/vmess", "host": h, "tls": "tls", "sni": sni };
                link = "vmess://" + btoa(JSON.stringify(v));
            }
            if(type==='trojan') link = "trojan://BOYSUPOT_Pass_123@"+addr+":443?security=tls&sni="+sni+"&type=ws&host="+h+"&path=/trojan#BOYSUPOT-TROJAN";
            if(type==='ss') {
                const ssAuth = btoa("aes-128-gcm:BOYSUPOT_Pass_123");
                link = "ss://" + ssAuth + "@" + addr + ":443?plugin=v2ray-plugin%3Bmode%3Dwebsocket%3Bhost%3D" + h + "%3Bpath%3D%2Fss%3Btls#BOYSUPOT-SS";
            }
            const el = document.getElementById('result');
            el.style.display = 'block';
            el.innerHTML = "<b>" + type.toUpperCase() + " LINK:</b><br><br>" + link;
        }
    </script>
</body>
</html>
EOF
sed -n '1,200p' public/index.html


# 5. DOCKERFILE
cat > Dockerfile <<'EOF'
FROM teddysun/xray:latest AS xray
FROM node:18-alpine
COPY --from=xray /usr/bin/xray /usr/bin/xray
WORKDIR /app
COPY . .
RUN npm install express http-proxy-middleware --silent
EXPOSE 8080
CMD ["node", "server.js"]
EOF
sed -n '1,80p' Dockerfile


# 6. DEPLOY
gcloud run deploy boysupotph \
  --source . \
  --region asia-southeast1 \
  --allow-unauthenticated
