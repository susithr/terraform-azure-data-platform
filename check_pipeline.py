import os
import argparse

from azure.identity import AzureCliCredential
from azure.mgmt.datafactory import DataFactoryManagementClient


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("run_id")
    args = parser.parse_args()

    client = DataFactoryManagementClient(
        credential=AzureCliCredential(),
        subscription_id=os.environ["AZURE_SUBSCRIPTION_ID"],
    )

    run = client.pipeline_runs.get(
        resource_group_name="rg-data-platform-dev",
        factory_name="adf-stlearningde839271",
        run_id=args.run_id,
    )

    print(f"Pipeline: {run.pipeline_name}")
    print(f"Status: {run.status}")

    if run.message:
        print(f"Message: {run.message}")


if __name__ == "__main__":
    main()