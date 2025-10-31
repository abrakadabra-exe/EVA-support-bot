# Official n8n
FROM n8nio/n8n:latest

# Expose port
EXPOSE 5678

# Core settings
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://eva-support-bot.onrender.com/

# Auth (set password manually)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=evaadmin
ENV N8N_BASIC_AUTH_PASSWORD=eva123!@#

# Use SQLite (default)
ENV EXECUTIONS_MODE=regular
ENV DB_TYPE=sqlite

# Timezone
ENV GENERIC_TIMEZONE=UTC

# Copy workflow into container
COPY "EVA Support Bot.json" /home/node/.n8n/workflows/EVA-Support-Bot.json

# Auto-import workflow on startup
RUN echo '{"name":"EVA Support Bot","nodes":[...],"connections":{},"active":false,"settings":{},"id":"1"}' > /tmp/workflow.json && \
    n8n import:workflow --input=/home/node/.n8n/workflows/EVA-Support-Bot.json || true

# Start n8n
ENTRYPOINT ["/docker-entrypoint.sh"]
