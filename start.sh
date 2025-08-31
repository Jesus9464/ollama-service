#!/bin/bash

# Iniciar el servidor de Ollama en segundo plano
ollama serve &

# Esperar a que el servicio de Ollama esté disponible
echo "Esperando a que Ollama esté listo..."
until curl -s http://localhost:11434/api/version > /dev/null; do
    echo "Esperando..."
    sleep 2
done

echo "Ollama está listo. Descargando modelo qwen2:1.5b..."

# Descargar el modelo qwen2:1.5b (el más pequeño y eficiente)
ollama pull qwen2:1.5b

echo "Modelo qwen2:1.5b descargado exitosamente."

# Mantener el contenedor ejecutándose
wait