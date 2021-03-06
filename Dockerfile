FROM unocha/alpine-base:3.8

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache --upgrade \
        libgfortran \
        libstdc++ \
        python3 && \
    apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        python3-dev && \
    apk add --no-cache --upgrade \
        py3-numpy@edge \
        py3-scipy@edge \
        py-numpy-dev@edge && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install --no-build-isolation pandas && \
    apk del \
        .build-deps \
        py-numpy-dev && \
    rm -rf /var/lib/apk/*
