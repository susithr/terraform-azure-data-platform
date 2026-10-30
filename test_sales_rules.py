import unittest

from sales_rules import calculate_order_total


class TestSalesRules(unittest.TestCase):
    def test_negative_quantity_is_rejected(self):
        order = {
            "quantity": "-1",
            "unit_price": "25",
        }

        with self.assertRaisesRegex(
            ValueError, "Quantity must be positive"
        ):
            calculate_order_total(order)

    def test_decimal_price_total(self):
        order = {
            "quantity": "3",
            "unit_price": "19.99",
        }

        actual_total = calculate_order_total(order)

        self.assertEqual(actual_total, "59.97")
    def test_valid_order_total(self):
        order = {
            "quantity": "2",
            "unit_price": "25",
        }

        actual_total = calculate_order_total(order)

        self.assertEqual(actual_total, "50")


if __name__ == "__main__":
    unittest.main()