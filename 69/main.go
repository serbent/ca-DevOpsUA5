// pakage main defines the main package
package main

import "fmt"

func main() {
	var a int = 5
	var b int = 10
	var sum int = a + b
	fmt.Println("The sum of", a, "and", b, "is:")
	fmt.Println(a, "+", b, "=", a+b)
	fmt.Println("Sum: ", sum)
	fmt.Println("Hello, World!")
	fmt.Println("Division:", b/a)
}