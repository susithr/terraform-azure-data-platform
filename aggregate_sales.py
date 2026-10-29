import csv
from decimal import Decimal
from pathlib import Path

folder = Path(__file__).parent / "sample-data"
totals = {}

with (folder / "sales-silver.csv").open(
    newline="", encoding="utf-8"
) as source:
    for row in csv.DictReader(source):
        product = row["product"]

        if product not in totals:
            totals[product] = {
                "quantity": 0,
                "sales": Decimal("0"),
            }

        totals[product]["quantity"] += int(row["quantity"])
        totals[product]["sales"] += Decimal(row["order_total"])

with (folder / "sales-gold.csv").open(
    "w", newline="", encoding="utf-8"
) as destination:
    writer = csv.writer(destination)
    writer.writerow(["product", "total_quantity", "total_sales"])

    for product, values in sorted(totals.items()):
        writer.writerow([
            product,
            values["quantity"],
            values["sales"],
        ])

total_revenue = sum(
    (values["sales"] for values in totals.values()),
    Decimal("0"),
)

print(f"Products: {len(totals)}")
print(f"Total revenue: {total_revenue}")