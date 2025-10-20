package main 
import "fmt"
import "errors"

func errorsExample(arg int) (int, error) {
	if arg < 0 {
		return 0, errors.New("negative argument not allowed")
	} else if arg == 0 {
		return 0, errors.New("zero argument not allowed")
	}
	return arg * 2, nil
}

func main(){
	result, err := errorsExample(0)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Result:", result)
	}
}
