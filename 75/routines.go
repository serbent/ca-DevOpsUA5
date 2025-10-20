package main 

import (
	"fmt"
	"time"
)

func routinesExample(arg int) {
	// Example of a goroutine
		for i := 1; i <= arg; i++ {
			fmt.Printf("Goroutine iteration %d\n", i)
			time.Sleep(500 * time.Millisecond)
		}
}

func main() {
	go routinesExample(20) // runs in a separate goroutine
	fmt.Println("Main function is doing other work...")
	time.Sleep(6 * time.Second) // Wait to allow goroutine to finish
	fmt.Println("Main function finished.")

}