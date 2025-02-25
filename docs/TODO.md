
## Remaining Work to Complete the Exercise

1. **Data Loading and Validation:**
   - Ensure all data files (`unity_golf_club.txt`, `us_softball_league.txt`, `company.csv`) are correctly loaded into the database.
   - Modify load_data script to test for this

2. **Dbt Documentation & Tests:**
   - Create yml files for documentation all models
   - Ensure that each model has a primary key and test for unique and not null constraints
   - Add additional tests for business logic as needed


## Suggestions for Further Enhancement

1. **Source Freshness:**
   - Add sources freshness configs if appropriate

2. **Performance Optimization:**
   - Analyze query performance and optimize where necessary, especially in the `int_sports_league.sql` and `sports_league.sql` models.
   - We are starting with view materialization for all models
   - Eventually as the data volumes grow and the models become more complex we can switch to table and then to incremental materialization

3. **Grants:**
   - Configure role grants on models for access control where necessary

4. **Data Quality Improvements:**
   - Implement additional data quality checks, such as outlier detection and data consistency checks.
   - Use DBT's `dbt_utils` package to leverage advanced testing capabilities.
   - Or consider tools like Monte Carlo for even for advanced testing scenarios

5. **Automation and CI/CD:**
   - Set up a CI/CD pipeline to automate testing and deployment of DBT models.
   - Use tools like GitHub Actions or Jenkins for continuous integration.
