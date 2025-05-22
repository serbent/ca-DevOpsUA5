package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "hello CodeAcademy!!!!!!!")
}

func main() {
	http.HandleFunc("/", helloHandler)
	http.ListenAndServe(":8080", nil)
}