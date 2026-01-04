FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04

# ------------------------
# System / OS dependencies
# ------------------------
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    git \
    curl \
    wget \
    libgl1 \
    libglib2.0-0 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ------------------------
# Python setup
# ------------------------
WORKDIR /workspace
COPY requirements.txt .

RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# ------------------------
# Default
# ------------------------
CMD ["bash"]



