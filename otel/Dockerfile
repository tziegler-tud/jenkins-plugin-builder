FROM otel/opentelemetry-collector-builder:latest AS build-stage
COPY ./builder-config.yaml builder-config.yaml
RUN builder --config builder-config.yaml


FROM gcr.io/distroless/base:latest

ARG USER_UID=10001
USER ${USER_UID}

COPY ./collector-config.yaml /otelcol/collector-config.yaml
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --chmod=755 --from=build-stage /build/otelcol-obs-agent /otelcol

ENTRYPOINT ["/otelcol/otelcol-obs-agent"]
CMD ["--config", "/otelcol/collector-config.yaml"]

EXPOSE 4317 4318 12001
