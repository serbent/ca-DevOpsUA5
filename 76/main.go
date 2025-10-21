package main 
import (
	"fmt"
)
import "simple-calculator/calculator"

func main() {
	a, b := 10, 5

	sum := calculator.Add(a, b)
	diff := calculator.Subtract(a, b)
	prod := calculator.Multiply(a, b)
	quot, err := calculator.Divide(a, b)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Printf("Quotient: %d\n", quot)
	}

	fmt.Printf("Sum: %d\n", sum)
	fmt.Printf("Difference: %d\n", diff)
	fmt.Printf("Product: %d\n", prod)
}