FROM debian:buster-slim
WORKDIR /install
RUN apt-get update && apt-get install curl unzip -y
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
ENV DENO_INSTALL="/root/.deno"
ENV PATH="/root/.deno/bin:$PATH"
WORKDIR /app
ENTRYPOINT ["deno"]