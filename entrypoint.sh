#!/bin/bash
set -e

# Remove um possível server.pid pré-existente
rm -f /meu_app/tmp/pids/server.pid

# Executa o processo principal do container
exec "$@"