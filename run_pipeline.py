import os

from azure.identity import AzureCliCredential
from azure.mgmt.datafactory import DataFactoryManagementClient


def main():
    subscription_id = os.environ["AZURE_SUBSCRIPTION_ID"]

    resource_group = "rg-data-platform-dev"
    factory_name = "adf-stlearningde839271"
    pipeline_name = "pl_inspect_orders"

    credential = AzureCliCredential()

    client = DataFactoryManagementClient(
        credential=credential,
        subscription_id=subscription_id,
    )

    result = client.pipelines.create_run(
        resource_group_name=resource_group,
        factory_name=factory_name,
        pipeline_name=pipeline_name,
        parameters={"file_name": "orders.csv"},
    )

    print(f"Pipeline submitted: {pipeline_name}")
    print(f"Run ID: {result.run_id}")


if __name__ == "__main__":
    main()