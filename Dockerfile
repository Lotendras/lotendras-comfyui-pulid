FROM runpod/worker-comfyui:5.10.0-base-cuda12.8.1
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
RUN cd /comfyui/custom_nodes && git clone https://github.com/lldacing/ComfyUI_PuLID_Flux_ll.git
RUN sed -i '/facenet-pytorch/d' /comfyui/custom_nodes/ComfyUI_PuLID_Flux_ll/requirements.txt && \
    pip install --no-cache-dir -r /comfyui/custom_nodes/ComfyUI_PuLID_Flux_ll/requirements.txt && \
    pip install --no-cache-dir --no-deps facenet-pytorch
RUN echo "  pulid: models/pulid/" >> /comfyui/extra_model_paths.yaml
