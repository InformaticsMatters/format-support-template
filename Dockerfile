ARG from_image=python:3.9.1
FROM ${from_image}

ENV FORMAT_USER formatter
# Base directory for the application
# Also used for user directory
ENV APP_ROOT /home/${FORMAT_USER}

# Construct key directories
WORKDIR ${APP_ROOT}
WORKDIR /dataset/input
WORKDIR /dataset/output

# Containers should NOT run as root
RUN useradd -d ${APP_ROOT} -s /bin/bash ${FORMAT_USER} && \
    chown -R ${FORMAT_USER}.${FORMAT_USER} ${APP_ROOT}

COPY docker-entrypoint.sh ${APP_ROOT}/
RUN chown -R ${FORMAT_USER}.${FORMAT_USER} ${APP_ROOT} && \
    chown -R ${FORMAT_USER}.${FORMAT_USER} /dataset/output

# Switch to container user
ENV HOME ${APP_ROOT}
WORKDIR ${APP_ROOT}
USER ${FORMAT_USER}

# Start the application
CMD ./docker-entrypoint.sh
