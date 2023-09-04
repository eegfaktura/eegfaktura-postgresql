#!/bin/bash
# eegfakuta-postgresql
# Postgrsql Container for eegfaktura
# Copyright (C) 2023 Verein zur Förderung von Erneuerbaren Energiegemeinschaften
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
set -e

PSQL=`which psql`

# Create filestore schema
$PSQL -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$DB_DATABASE" <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS filestore;
    GRANT ALL PRIVILEGES ON DATABASE $DB_DATABASE TO $DB_USERNAME;
    GRANT ALL ON SCHEMA filestore TO $DB_USERNAME;
EOSQL
