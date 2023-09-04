# syntax=docker/dockerfile:1
# vfeeg-filestor File handling for EEGFaktura
# Copyright (C) 2023  Matthias Poettinger
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

FROM postgres:15-alpine
LABEL org.vfeeg.vendor="Verein zur Förderung von Erneuerbaren Energiegemeinschaften"
LABEL org.vfeeg.image.authors="eegfaktura@vfeeg.org"
LABEL org.opencontainers.image.vendor="Verein zur Förderung von Erneuerbaren Energiegemeinschaften"
LABEL org.opencontainers.image.authors="eegfaktura@vfeeg.org"
LABEL org.opencontainers.image.title="eegfaktura-postgresql"
LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.description="Database container with initial DB Schema for EEG Faktura"
LABEL org.opencontainers.image.licenses=AGPL-3.0
LABEL org.opencontainers.image.source=https://github.com/eegfaktura/eegfaktura-postgresql
LABEL org.opencontainers.image.base.name=docker.io/postgres:15-alpine
LABEL description="Database container with initial DB Schema for EEG Faktura"
LABEL version="0.1.0"

#WORKDIR /eegfaktura-postgresql

RUN chown 70 docker-entrypoint-initdb.d
COPY --chown=70 docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d

ENV DB_HOSTNAME="eegfaktura-postgres"
ENV DB_DATABASE="eegfaktura"

EXPOSE 5432