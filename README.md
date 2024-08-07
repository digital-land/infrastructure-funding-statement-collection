# infrastructure-funding-statement collection ⚠️ Centralised

[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/digital-land/infrastructure-funding-statement/blob/main/LICENSE)
[![Run pipeline](https://github.com/digital-land/infrastructure-funding-statement-collection/actions/workflows/run.yml/badge.svg)](https://github.com/digital-land/infrastructure-funding-statement-collection/actions/workflows/run.yml)

The data and pipeline to build the [infrastructure-funding-statement dataset](https://www.digital-land.info/dataset/infrastructure-funding-statement).

# Collection

* [collection/source.csv](collection/source.csv) — the list of data sources by organisation, see [specification/source](https://digital-land.github.io/specification/schema/source/)
* [collection/endpoint.csv](collection/endpoint.csv) — the list of endpoint URLs for the collection, see [specification/endpoint](https://digital-land.github.io/specification/schema/endpoint)
* [collection/resource/](collection/resource/) — collected resources

*These files are now stored in AWS S3:*

* [collection/log/](https://files.planning.data.gov.uk/infrastructure-funding-statement-collection/collection/log/) — individual log JSON files, created by the collection process
* [collection/log.csv](https://files.planning.data.gov.uk/infrastructure-funding-statement-collection/collection/log.csv) — a collection log assembled from the individual log files, see [specification/log](https://files.planning.data.gov.uk/infrastructure-funding-statement-collection/https://digital-land.github.io/specification/schema/log)
* [collection/resource.csv](https://files.planning.data.gov.uk/infrastructure-funding-statement-collection/collection/resource.csv) — a list of collected resources, see [specification/resource](https://files.planning.data.gov.uk/infrastructure-funding-statement-collection/https://digital-land.github.io/specification/schema/resource)

# Updating the collection

We recommend working in [virtual environment](http://docs.python-guide.org/en/latest/dev/virtualenvs/) before installing the python [requirements](requirements.txt), [makerules](https://github.com/digital-land/makerules) and other dependencies. Requires Make v4.0 or above.

    $ make makerules
    $ make init
    $ make collect

# Building the datasets

The collected files can then be converted into a national dataset:

    $ make

# Adding IFS Data

This repository is slightly different in that there is only one endpoint, and we host it. The data entries are collected from the ./data/infrastructure-funding-statement.csv file, processed and then rendered on the platform. In order to add more data entries, create a csv file including the new data and the same fields as the existing infrastructure-funding-statement.csv file.

Once you've created the csv file of the new data entries, you can run:
- `python bin/create-appended-IFS-data.py [FILE PATH TO NEW DATA CSV]`


If for some reason you need to specify a different file to append the new data to, other than infrastructure-funding-statement.csv:
- `python bin/create-appended-IFS-data.py [FILE PATH TO NEW DATA CSV] --current_IFS_data_filepath [FILEPATH ALTERNATIVE ORIGINAL CSV]`

This script should create a new file with the following name and location: `data/combined_IFS_data.csv`. This should contain all existing data entries with your additions, ordered alphabetically by organisation.

Once the new file is checked, rename this to infrastructure-funding-statement.csv and delete the old file.

# Licence

The software in this project is open source and covered by the [LICENSE](LICENSE) file.

Individual datasets copied into this repository may have specific copyright and licensing, otherwise all content and data in this repository is
[© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/)
and available under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.
