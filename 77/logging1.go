package main 

import (
	"log"
	// "time"
)

const (
	YYMMDD = "2006-01-02"
	HHMMSS = "15:04:05"
)

func main () {
	// log.SetFlags(log.Ldate | log.Ltime)
	log.Println("Application started")

	flags := log.Lshortfile | log.Lmicroseconds

	log.Println("Log with default flags")

	log.SetFlags(flags)

	log.SetPrefix("INFO: ")
	log.Println("This is an info message")

	log.SetPrefix("WARNING: ")
	log.Println("This is a warning message")

	log.SetPrefix("ERROR: ")
	log.Println("This is an error message")

	log.SetPrefix("")
	log.Println("Application finished")
}