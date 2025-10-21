package main 

import (
	"fmt"
)

func main () {
	message := make(chan string)
	ch := make(chan string, 2)

	ch <- "Message 1"
	ch <- "Message 2"
	ch <- "Message 3"
	
	go func() {
		message <- "Message from goroutine"
	}()
	msg0 := <- message
	fmt.Println(msg0)

	fmt.Println("Messages in channel:" , len (ch))

	msg1 := <- ch
	fmt.Println(msg1)
	msg2 := <- ch
	fmt.Println(msg2)
	
}