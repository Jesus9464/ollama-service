#!/bin/bash

# Iniciar el servidor de Ollama en segundo plano
ollama serve &

# Esperar a que el servicio de Ollama esté disponible
echo "Esperando a que Ollama esté listo..."
while ! curl -s http://localhost:11434 > /dev/null; do
    sleep 2
done

echo "Ollama está listo. Descargando modelo mistral..."

# Descargar el modelo mistral
ollama pull mistral

echo "Modelo mistral descargado exitosamente."

# Mantener el contenedor ejecutándose
wait