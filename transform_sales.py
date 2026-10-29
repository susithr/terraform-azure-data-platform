import csv
from decimal import Decimal, InvalidOperation
from pathlib import Path

folder = Path(__file__).parent / "sample-data"

valid_rows = []
invalid_rows = []

with (folder / "orders-downloaded.csv").open(
    newline="", encoding="utf-8-sig"
) as source:
    reader = csv.DictReader(source)
    columns = reader.fieldnames

    for row in reader:
        try:
            quantity = int(row["quantity"])
            price = Decimal(row["unit_price"])

            if quantity <= 0:
                raise ValueError("Quantity must be positive")

            if not price.is_finite() or price < 0:
                raise ValueError("Price must be finite and non-negative")

            row["order_total"] = str(quantity * price)
            valid_rows.append(row)

        except (ValueError, InvalidOperation) as error:
            row["rejection_reason"] = str(error)
            invalid_rows.append(row)

def write_csv(filename, fieldnames, rows):
    with (folder / filename).open(
        "w", newline="", encoding="utf-8"
    ) as destination:
        writer = csv.DictWriter(destination, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

write_csv(
    "sales-silver.csv",
    columns + ["order_total"],
    valid_rows,
)

write_csv(
    "sales-quarantine.csv",
    columns + ["rejection_reason"],
    invalid_rows,
)

print(f"Valid orders: {len(valid_rows)}")
print(f"Rejected orders: {len(invalid_rows)}")