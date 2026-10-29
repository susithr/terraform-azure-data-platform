\# Azure Data Platform with Terraform



A learning project that provisions Azure data engineering infrastructure.



\## Infrastructure



\- Azure resource group

\- ADLS Gen2 storage account

\- Bronze, Silver, Gold, and Quarantine containers

\- Azure Data Factory with managed identity

\- Role-based access to storage

\- Parameterized Lookup pipeline

\- Remote Terraform state in separate Azure storage



\## Data processing



Local Python scripts validate sample sales records and create

product-level summaries. Results are manually uploaded to Azure.



The Data Factory pipeline reads a selected Bronze CSV.

It does not yet run the Python transformations.



\## Validation



GitHub Actions checks Terraform formatting, validates configuration,

and runs mocked tests for the data-layers module.



\## Deployment



Review a Terraform plan before applying infrastructure changes.

CI currently checks code; it does not deploy to Azure.

