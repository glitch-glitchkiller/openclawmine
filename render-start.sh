#!/bin/sh
# Write config to OPENCLAW_STATE_DIR (which the gateway reads) and also ~/.openclaw as fallback
mkdir -p /data/.openclaw /home/node/.openclaw
cat > /data/.openclaw/openclaw.json << 'EOF'
{
  "gateway": {
    "trustedProxies": ["*"]
  }
}
EOF
cp /data/.openclaw/openclaw.json /home/node/.openclaw/openclaw.json
exec node dist/index.js gateway --allow-unconfigured --bind lan --port 10000
