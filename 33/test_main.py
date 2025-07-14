import unittest
from main import addition, subtraction, multiplication, division, greeting

class TestMain(unittest.TestCase):
    def test_addition(self):
        self.assertEqual(addition(2, 3), 5)
    def test_subtraction(self):
        self.assertEqual(subtraction(5, 2), 3)
    def test_multiplication(self):
        self.assertEqual(multiplication(4, 3), 12)
    def test_division(self):
        self.assertEqual(division(10, 3), 5)
    