# Usa la imagen base de Ollama
FROM ollama/ollama:latest

# Define la variable de entorno para que Ollama escuche en todas las interfaces
ENV OLLAMA_HOST=0.0.0.0

# Exponer el puerto por defecto de Ollama
EXPOSE 11434

# Copia el script de inicio al contenedor
COPY start.sh /start.sh

# Asegura que el script sea ejecutable
RUN chmod +x /start.sh

# Ejecuta el script de inicio
CMD ["/start.sh"]
