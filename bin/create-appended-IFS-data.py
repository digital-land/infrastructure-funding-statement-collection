#!/usr/bin/env python3

import argparse
import sys
import os
import hashlib
import pandas as pd

def create_hash(document_url):
    document_url_str = str(document_url)
    return hashlib.sha256(document_url_str.encode("utf-8")).hexdigest()

def add_reference_hash(df):
    df["reference"] = df["document-url"].apply(create_hash)
    return df

# fetches csv data and correct fields from given filepath
def get_IFS_data(filepath):
    try:
        df = pd.read_csv(filepath)
        df = df[["reference", "collection", "name", "organisation", "documentation-url", "document-url", "period-start-date", "period-end-date", "entry-date", "start-date", "end-date"]] 
        return df
    except FileNotFoundError:
        print(f"Error: File '{filepath}' not found.")
        sys.exit(1)
    except pd.errors.ParserError:
        print(f"Error: Unable to parse CSV file '{filepath}'.")
        sys.exit(1)

# grabs new csv data, fills in the reference (hash) column
def create_df_to_append(new_IFS_data_filepath):
    df = get_IFS_data(new_IFS_data_filepath)
    return add_reference_hash(df)

# appends the new data to existing IFS dataframe, drops duplicate rows (matching on all fields)
def append_IFS_data (df1, df2):
    combined_df = pd.concat([df1, df2], ignore_index=True)
    combined_df = combined_df.drop_duplicates()
    return combined_df

# grabs both the current, and new data
# fills reference column for new data, and appends this to the end of the existing data
# sorts values by organisation
def main (new_IFS_data_filepath, current_IFS_data_filepath):
    """
    Process IFS data.

    Fetches new IFS data and appends it to the existing IFS data.
    Saves the combined data to a CSV file.

    Parameters:
    - new_IFS_data_filepath (str): Path to the new IFS data CSV file.
    - current_IFS_data_filepath (str): Path to the current IFS data CSV file.
    """
    try:
        new_IFS_df = add_reference_hash(get_IFS_data(new_IFS_data_filepath)) 
        current_IFS_df = get_IFS_data(current_IFS_data_filepath)
        combined_df = append_IFS_data(new_IFS_df, current_IFS_df)
        combined_df = combined_df.sort_values(by=['organisation'], ascending=True).reset_index(drop=True)
        
        # Create the 'data' directory if it doesn't exist
        if not os.path.exists('data'):
            os.makedirs('data')

        # Define the output file path
        output_file = 'data/combined_IFS_data.csv'

        # Save the combined DataFrame to a CSV file
        combined_df.to_csv(output_file, index=False)
        print(f"Combined data saved to {output_file}")
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process IFS data.")
    parser.add_argument("new_IFS_data_filepath", type=str, help="Path to the new IFS data CSV file.")
    parser.add_argument("--current_IFS_data_filepath", type=str, default='./data/infrastructure-funding-statement.csv', help="Path to the current IFS data CSV file. Default: ./data/infrastructure-funding-statement.csv")
    args = parser.parse_args()

    main(args.new_IFS_data_filepath, args.current_IFS_data_filepath)
