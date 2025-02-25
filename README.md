# DBT Analytics Project

## Prerequisites
- Python 3.9+
- Snowflake account credentials
- Pipenv

## Setup Instructions

1. Install Python 3.9+ if not already installed

2. Install Pipenv:
```bash
pip install pipenv
```

3. Install project dependencies:
```bash
# Install all dependencies including development packages
pipenv install --dev

# Activate the virtual environment
pipenv shell
```

4. Install and set up PostgreSQL:
   - Download and install PostgreSQL from [postgresql.org](https://www.postgresql.org/download/)
   - After installation, connect to PostgreSQL using psql or your preferred client
   - Create the 'raw' schema:
```sql
-- Connect to your database
\c postgres

-- Create the raw schema
CREATE SCHEMA raw;
```

5. Set up local PostgreSQL database:
   - Create a `.env` file and load your local environment with your PostgreSQL credentials:
```env
DB_USER=your_username
DB_PASSWORD=your_password
```

6. Load source data:
```bash
# Place your data files in the data/ directory:
# - company.csv
# - unity_golf_club.txt
# - us_softball_league.txt

# Run the data loading script
python scripts/load_data.py
```

7. Configure Snowflake connection:
   - Copy `profiles.yml.example` to `~/.dbt/profiles.yml`
   - Update with your Snowflake credentials:
```yaml
your_project_name:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <your-account>
      user: <username>
      password: <password>
      role: <role>
      database: <database>
      warehouse: <warehouse>
      schema: <schema>
      threads: 4
```

8. Verify connection:
```bash
dbt debug
```

9. Run the project:
```bash
# Clean dbt artifacts
dbt clean

# Install/update dbt packages
dbt deps

# Run all models
dbt run

# Run specific models
dbt run --select model_name

# Run tests
dbt test

# Run all models, tests, seeds, etc.
dbt build
```

## Project Structure
```
├── analyses/          # Ad-hoc analyses
├── macros/           # Custom macros
├── models/
│   ├── staging/      # Staging models - raw data transformation
│   ├── intermediate/ # Intermediate models - business logic
│   ├── marts/        # Final presentation models
│   └── data_quality/ # Data quality checks and monitoring
├── seeds/            # Static data files
├── tests/            # Custom test definitions
├── docs/             # Project documentation
│   └── TODO.md       # Project next steps
├── .sqlfluff         # SQLFluff configuration
├── .sqlfluffignore   # SQLFluff ignore patterns
├── Pipfile           # Python dependency management
├── dbt_project.yml   # DBT project configuration
└── profiles.yml.example  # Example DBT connection profile
```

## Code Quality Tools

### Setup
```bash
# Install development dependencies including code quality tools
pipenv install --dev

# Activate the virtual environment
pipenv shell

# Install pre-commit hooks
pre-commit install
```

### Available Tools
- **SQLFluff**: SQL linter and formatter
- **pre-commit**: Git hooks for automated code quality checks

### Manual Usage
```bash

# Run pre commit for all files
pre-commit run --all-files
```

Pre-commit hooks will automatically run these checks before each commit. Failed checks must be fixed before the commit can proceed.
