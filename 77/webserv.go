package main 

import (
	"fmt"
	"time"
	"net/http"
	"log"
)





func timeHandler (w http.ResponseWriter, r *http.Request) {
	currentTime := time.Now().Format("2006-01-02 15:04:05")
	fmt.Fprintf(w, "Current server time is: %s", currentTime)
}

func rootHandler (w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to the Go Web Server!")
}

func main () {
	http.HandleFunc("/", rootHandler)
	http.HandleFunc("/time", timeHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}