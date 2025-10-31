# Use official n8n image
FROM n8nio/n8n:latest

# Expose port
EXPOSE 5678

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=evaadmin
ENV WEBHOOK_URL=https://eva-support-bot.onrender.com/
ENV GENERIC_TIMEZONE=UTC
ENV EXECUTIONS_MODE=queue
ENV EXECUTIONS_DATA_SAVE_ON_ERROR=all
ENV EXECUTIONS_DATA_SAVE_ON_SUCCESS=all

# Persistent volume will be mounted by Render
VOLUME /home/node/.n8n

# Start n8n
CMD ["n8n", "start"]
