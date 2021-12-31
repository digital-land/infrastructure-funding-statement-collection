INFRASTRUCTURE_FUNDING_STATEMENT_DATASET=$(DATASET_DIR)infrastructure-funding-statement.csv
INFRASTRUCTURE_FUNDING_STATEMENT_TRANSFORMED_FILES=\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/3ba828321bd67edb248db116b22a2d5fae9ab37eb8562be2ff873db45d4be30a.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/77eb8ea9a284f8ed0f8969d29b98ad803bb71d7f49342d2d5f176d45cd3595d3.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/9e63d317198ebe670b334fddcbeb45dfe19a4ed0514656f9f39be525a118509e.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/a33dbf7521ca996e9623df3c9feee59fa12efd142d3a4d6827cd1fd6e9d7cbaa.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/b11fc93e2aa8fc1e9da08b96ff00520af1e0bbf0659cecc301786609cbfec533.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/c6d09b234c0b9acb4271ef0e8b95a3519f6067f27510dc7b4216d9fb2b92d6fc.csv\
    $(TRANSFORMED_DIR)infrastructure-funding-statement/cb4f807b8cc7e3ead78215b833ef4f5e62b9293739ea4bef00cfaed3a2c9fdd3.csv

$(TRANSFORMED_DIR)infrastructure-funding-statement/3ba828321bd67edb248db116b22a2d5fae9ab37eb8562be2ff873db45d4be30a.csv: collection/resource/3ba828321bd67edb248db116b22a2d5fae9ab37eb8562be2ff873db45d4be30a
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/77eb8ea9a284f8ed0f8969d29b98ad803bb71d7f49342d2d5f176d45cd3595d3.csv: collection/resource/77eb8ea9a284f8ed0f8969d29b98ad803bb71d7f49342d2d5f176d45cd3595d3
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/9e63d317198ebe670b334fddcbeb45dfe19a4ed0514656f9f39be525a118509e.csv: collection/resource/9e63d317198ebe670b334fddcbeb45dfe19a4ed0514656f9f39be525a118509e
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/a33dbf7521ca996e9623df3c9feee59fa12efd142d3a4d6827cd1fd6e9d7cbaa.csv: collection/resource/a33dbf7521ca996e9623df3c9feee59fa12efd142d3a4d6827cd1fd6e9d7cbaa
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/b11fc93e2aa8fc1e9da08b96ff00520af1e0bbf0659cecc301786609cbfec533.csv: collection/resource/b11fc93e2aa8fc1e9da08b96ff00520af1e0bbf0659cecc301786609cbfec533
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/c6d09b234c0b9acb4271ef0e8b95a3519f6067f27510dc7b4216d9fb2b92d6fc.csv: collection/resource/c6d09b234c0b9acb4271ef0e8b95a3519f6067f27510dc7b4216d9fb2b92d6fc
	$(run-pipeline)

$(TRANSFORMED_DIR)infrastructure-funding-statement/cb4f807b8cc7e3ead78215b833ef4f5e62b9293739ea4bef00cfaed3a2c9fdd3.csv: collection/resource/cb4f807b8cc7e3ead78215b833ef4f5e62b9293739ea4bef00cfaed3a2c9fdd3
	$(run-pipeline)

$(INFRASTRUCTURE_FUNDING_STATEMENT_DATASET): $(INFRASTRUCTURE_FUNDING_STATEMENT_TRANSFORMED_FILES)
	$(build-dataset)

transformed:: $(INFRASTRUCTURE_FUNDING_STATEMENT_TRANSFORMED_FILES)

dataset:: $(INFRASTRUCTURE_FUNDING_STATEMENT_DATASET)
