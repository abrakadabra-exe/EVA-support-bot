# Use official n8n image
FROM n8nio/n8n:latest

# Expose port
EXPOSE 5678

# Environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=evaadmin
ENV WEBHOOK_URL=https://eva-support-bot.onrender.com/
ENV GENERIC_TIMEZONE=UTC

# Use SQLite (default) — NO QUEUE MODE
ENV EXECUTIONS_MODE=regular
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true

# Security
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false

# Persistent volume (free tier = no disk, but declare)
VOLUME /home/node/.n8n

# Official entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
