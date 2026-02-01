#!/bin/sh
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'EOF'
{
  "gateway": {
    "trustedProxies": ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }
}
EOF
exec node dist/index.js gateway --allow-unconfigured --bind lan --port 10000
