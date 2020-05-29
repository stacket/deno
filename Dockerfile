FROM debian:buster-slim
WORKDIR /install

ADD  ./run.sh /run.sh
RUN chmod +x /run.sh

RUN apt-get update && apt-get install curl unzip -y
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV DENO_INSTALL="/root/.deno"
ENV PATH="/root/.deno/bin:$PATH"
ENV CMD="https://deno.land/std/examples/welcome.ts"

WORKDIR /app
CMD trap 'exit' INT; /run.sh