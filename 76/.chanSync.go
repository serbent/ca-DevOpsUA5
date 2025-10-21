package main 

import (
	"fmt"
	"time"
)

func worker(done chan bool){
	fmt.Println("Worker is doing some work...")
	time.Sleep(2 * time.Second)
	fmt.Println("Worker finished work.")
	done <- true
}

func main () {
	done := make (chan bool)
	go worker(done)
	<- done
	fmt.Println("Main function received done signal.")
}