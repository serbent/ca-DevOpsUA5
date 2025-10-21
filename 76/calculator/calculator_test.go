package calculator

import "testing"

func TestAdd(t *testing.T) {
	result := Add(3, 5)
	expected := 8
	if result != expected {
		t.Errorf("Add(3, 5) = %d; want %d", result, expected)
	}
}

func TestSubtract(t *testing.T)	{
	result := Subtract(10, 4)
	expected := 6
	if result != expected {
		t.Errorf("Subtract(10, 4) = %d; want %d", result, expected)
	}
}

func TestMultiply(t *testing.T)	{
	result := Multiply(7, 6)
	expected := 42
	if result != expected {
		t.Errorf("Multiply(7, 6) = %d; want %d", result, expected)
	}
}

func TestDivide(t *testing.T)	{
	result, err := Divide(20, 4)
	expected := 5
	if err != nil {
		t.Errorf("Divide(20, 4) returned an error: %v", err)
	}
	if result != expected {
		t.Errorf("Divide(20, 4) = %d; want %d", result, expected)
	}

	_, err = Divide(10, 0)
	if err == nil {
		t.Errorf("Divide(10, 0) did not return an error for division by zero")
	}
}