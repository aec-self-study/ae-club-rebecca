import unittest
from calc import aec_subtract, aec_divide

class TestSubtract(unittest.TestCase):

    def test_subtract(self):
        arg_ints = [20, 5]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 15)
    
    def test_cant_go_below_zero(self):
        arg_ints = [5, 20]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 0)

class TestDivision(unittest.TestCase):
    def test_division(self):
        arg_ints = [20, 5]
        division_results = aec_divide(arg_ints)
        self.assertEqual(division_results, 4)
    
    def test_division_by_0(self):
        arg_ints = [20, 0]
        division_results = aec_divide(arg_ints)
        self.assertEqual(division_results, 0)    

if __name__ == "__main__":
    unittest.main()