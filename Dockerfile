# Usa la imagen base de Ollama
FROM ollama/ollama:latest

# Define la variable de entorno para que Ollama escuche en todas las interfaces
ENV OLLAMA_HOST=0.0.0.0:11434

# Exponer el puerto por defecto de Ollama
EXPOSE 11434

# Copia el script para descargar el modelo mistral
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

# Ejecuta el script que descarga el modelo y luego inicia el servidor
CMD ["/usr/local/bin/start.sh"]