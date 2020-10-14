FROM docker.io/gcc:10.2 AS builder
COPY hello-s.s /opt
WORKDIR /opt
RUN gcc -c hello-s.s && \
  ld hello-s.o -o hello-s

FROM scratch
COPY --from=builder /opt/hello-s .
ENTRYPOINT ["./hello-s"]