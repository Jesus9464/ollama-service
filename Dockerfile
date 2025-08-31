# Usa la imagen base de Ollama
FROM ollama/ollama:latest

# Define la variable de entorno para que Ollama escuche en todas las interfaces
ENV OLLAMA_HOST=0.0.0.0

# Exponer el puerto por defecto de Ollama
EXPOSE 11434

# Ejecuta Ollama y descarga el modelo mistral al iniciar el contenedor
CMD sh -c "ollama serve & sleep 5 && ollama pull mistral && wait"
