#!/bin/bash

# Esperar a que el servicio de Ollama esté disponible
sleep 10

# Descargar el modelo mistral
ollama pull mistral

# Mantener el script en ejecución para que el contenedor no se detenga
tail -f /dev/null
