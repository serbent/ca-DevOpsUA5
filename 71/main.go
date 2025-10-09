package main

import "fmt"

func sum(a int, b int) int {
	return a + b
}

func minus(a int, b int) int {
	if a < b {
		return b - a
	}else if a == b {
		return 0
	}
	return a - b
}

func sumAll(numbers ...int) int {
	total := 0
	for _, number := range numbers {
		total += number
	}
	return total
}

func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n-1)
}

func main() {
	var sumVar int
	var minusVar int
	sumVar = sum(2,3)
	minusVar = minus(2,3)
	fmt.Println("Sum of 2 and 3 is: ", sumVar)
	fmt.Println("Minus of 2 and 3 is: ", minusVar)
	fmt.Println(sum(2,3))
	fmt.Println(minus(2,3))
	
	fmt.Println(sumAll(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))

	fmt.Println("Factorial of 9 is ",factorial(9))
}

