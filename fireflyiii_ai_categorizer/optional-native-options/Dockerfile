ARG BUILD_FROM
FROM ghcr.io/ejagombar/fireflyiii-ai-categorizer:latest AS upstream

FROM ${BUILD_FROM}

# Bring in the compiled binary + web assets from the upstream image
COPY --from=upstream /app /app

COPY run.sh /
RUN chmod a+x /run.sh

ENV CONFIG_FILE=/data/config.json
VOLUME /data
EXPOSE 3000

CMD [ "/run.sh" ]
