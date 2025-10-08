package main
import "fmt"

func main() {
	// Example conditions
	a := 100
	b := 100
	if a < b {
		fmt.Println(a,"is less than", b)
	} else if a > b {
		fmt.Println(a,"is greater than",b)
	} else {
		fmt.Println(a,"is equal to",b)
	}

	i := 10
	switch i {
	case 1:
		fmt.Println("i is 1")
	case 2:
		fmt.Println("i is 2")
	case 3:
		fmt.Println("i is 3")
	default:
		fmt.Println("i is not 1, 2, or 3")
	}

	sliceA := []int{1, 2, 3, 4, 5}
	for _, value := range sliceA {
		fmt.Println("Value:", value)
	}

	sliceB := []string{"apple", "banana", "cherry"}
	for index, value := range sliceB {
		fmt.Println("Index:", index, "Value:", value)
	}

	fmt.Println("The 3rd element of sliceA is:", sliceA[2])
	fmt.Println("The 3rd element of sliceB is:", sliceB[2])
}