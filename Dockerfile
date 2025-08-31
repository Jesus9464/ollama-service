# Usa la imagen base de Ollama
FROM ollama/ollama:latest

# Define la variable de entorno para que Ollama escuche en todas las interfaces
ENV OLLAMA_HOST=0.0.0.0:11434

# Exponer el puerto por defecto de Ollama
EXPOSE 11434

# Copia el script para descargar el modelo mistral
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Sobrescribir el ENTRYPOINT original de ollama
ENTRYPOINT []
CMD ["/usr/local/bin/start.sh"]