# Starting to work

To start working with dbt-metabase you can run the following command:

Open your terminal then run the following commands:

```bash
git clone git@github.com:djamier/dbt-metabase.git
```

```bash
source config.sh
```

This command will do the following things:

- Create `venv` directory if not exist.
- Activate virtual environment.
- Update to latest pip.
- Install all pip packages defined in `requirements.txt`.

# Dbt-Metabase Setup

To start dbt-metabase, you can run the following commands:

```bash
docker-compose up -d
```
This command will start dbt, metabase, also postgres database and its dependencies in separate Docker containers, and the -d flag runs the containers in detached mode, allowing you to continue using your terminal.

# Start Working with DBT

```bash
cd dbt_project/second_project
dbt deps
touch profiles.yml
dbt run
```

# Accessing Metabase

TBD

# Accessing PostgreSQL

TBD

# Stop working

To stop working with dbt-metabase , you can run the following commands:

```bash
docker-compose down
deactivate
```