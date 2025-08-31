#!/bin/bash

# Variables de optimización para Railway
export OLLAMA_NUM_PARALLEL=1
export OLLAMA_MAX_LOADED_MODELS=1
export OLLAMA_FLASH_ATTENTION=1
export OLLAMA_HOST=0.0.0.0:11434

# Iniciar el servidor de Ollama en segundo plano
ollama serve &

# Esperar a que el servicio de Ollama esté disponible
echo "Esperando a que Ollama esté listo..."
until curl -s http://localhost:11434/api/version > /dev/null; do
    echo "Esperando..."
    sleep 2
done

echo "Ollama está listo. Descargando modelo qwen2:1.5b..."

# Descargar el modelo qwen2:1.5b con configuración optimizada
ollama pull qwen2:1.5b

echo "Modelo qwen2:1.5b descargado. Precargando modelo en memoria..."

# Hacer una llamada de prueba para cargar el modelo en memoria
curl -s -X POST http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen2:1.5b",
    "prompt": "test",
    "options": {"num_predict": 1}
  }' > /dev/null

echo "Modelo precargado y listo para usar."

# Mantener el contenedor ejecutándose
wait