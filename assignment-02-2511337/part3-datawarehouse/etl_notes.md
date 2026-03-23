## ETL Decisions

### Decision 1 —  Firstly Standardize the Date Format 
Problem: The raw dataset had inconsistent date formats e.g., DD-MM-YYYY and MM/DD/YYYY.
Resolution: By Converting all these dates into a standard format (YYYY-MM-DD) before loading into dim_date this issue can be resolved.

### Decision 2 — Handle all the NULL Values
Problem: Some fields like product category and store name had NULL values in it. 
Resolution: By Replacing the NULL values with appropriate default record or by removing the  incomplete records in order to maintain data quality.

### Decision 3 — By Fixing the Category Inconsistency
Problem: Here product categories were inconsistent (e.g., "electronics", "Electronics", "ELECTRONICS").
Resolution: By tandardizing these category values in order to proper case (e.g., "Electronics") we can ensure consistency in reporting.