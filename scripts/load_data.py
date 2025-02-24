import os
import pandas as pd

from sqlalchemy import create_engine
from dotenv import load_dotenv


def create_db_connection(user, password, host, port, database):
    return create_engine(f'postgresql://{user}:{password}@{host}:{port}/{database}')


def load_text_file(file_path, table_name, engine, schema, delimiter='\t'):
    df = pd.read_csv(file_path, delimiter=delimiter)
    df.to_sql(table_name, engine, schema=schema, if_exists='replace', index=False)


def load_csv_file(file_path, table_name, engine, schema):
    df = pd.read_csv(file_path)
    df.to_sql(table_name, engine, schema=schema, if_exists='replace', index=False)


def load_files_to_postgres(data_dir, csv_files, text_files, db_params, schema):
    engine = create_db_connection(**db_params)

    for file in csv_files:
        file_path = os.path.join(data_dir, file)
        table_name = os.path.splitext(file)[0]
        load_csv_file(file_path, table_name, engine, schema=schema)

    for file, delimiter in text_files:
        file_path = os.path.join(data_dir, file)
        table_name = os.path.splitext(file)[0]
        load_text_file(file_path, table_name, engine, schema=schema, delimiter=delimiter)


def main():
    load_dotenv()

    csv_files = [
        'company.csv'
    ]

    text_files = [
        ('unity_golf_club.txt', ','),
        ('us_softball_league.txt', '\t')
    ]
    # Usage example
    db_params = {
        'user': os.getenv('DB_USER'),
        'password': os.getenv('DB_PASSWORD'),
        'host': 'localhost',
        'port': '5432',
        'database': 'postgres'
    }

    load_files_to_postgres('./data', csv_files, text_files, db_params, 'raw')


if __name__ == "__main__":
    main()
