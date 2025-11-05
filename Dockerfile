FROM ubuntu:latest

# Instalación de dependencias necesarias
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv default-libmysqlclient-dev build-essential pkg-config

# Establece el directorio de trabajo donde estará la app
WORKDIR /home/ubuntu/apps
COPY requirements.txt .


# Crea el entorno virtual en /home/ubuntu/app/.venv
RUN python3 -m venv .venv

# Usa pip del entorno virtual para instalar dependencias
RUN .venv/bin/pip install --upgrade pip
RUN .venv/bin/pip install --no-cache-dir -r requirements.txt

