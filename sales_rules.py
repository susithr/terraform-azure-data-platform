from decimal import Decimal


def calculate_order_total(row):
    quantity = int(row["quantity"])
    price = Decimal(row["unit_price"])

    if quantity <= 0:
        raise ValueError("Quantity must be positive")

    if not price.is_finite() or price < 0:
        raise ValueError("Price must be finite and non-negative")

    return str(quantity * price)