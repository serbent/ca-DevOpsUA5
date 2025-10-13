package main 

import "fmt"

func main(){

	m := make(map[int]int)
	m[1] = 1
	m[2] = 2
	m[3] = 3
	m[4] = 4
	m[5] = 5
	m[6] = 6
	m[7] = 7
	m[8] = 8
	m[9] = 9
	m[10] = 10

	fmt.Println(m)

	fmt.Println(m[1])

	for k, v := range m {
		fmt.Println(k, v)
	}

	m[10] = 100
	fmt.Println(m)

	delete(m, 10)
	fmt.Println(m)

	_, ok := m[10]
	fmt.Println(ok)

	clear(m)
	fmt.Println(m)
}