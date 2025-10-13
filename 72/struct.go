package main

import "fmt"

type User struct {
		Name string
		Age int
		Ocupation string
		location string
		married bool
	}

func (u User) print() {
	fmt.Printf("Name: %s, Age: %d, Ocupation: %s, location: %s, married: %t", u.Name, u.Age, u.Ocupation, u.location, u.married)
}

func (u User) getName() string {
	return u.Name
}

func (u *User) changeName(newName string) {
	u.Name = newName
}

func (u *User) changeMarried() bool {
	if u.married == false {
		u.married = true
		return u.married
	}
	u.married = !u.married
	return u.married
}

func main(){
	John := User{
		Name: "John",
		Age: 30,
		Ocupation: "Developer",
		location: "USA",
		married: false,
	}
	// fmt.Println(u)
	
	John.print()


	John.changeName("John Doe")
	fmt.Println()
	John.print()	

	John.changeMarried()
	fmt.Println()
	John.print()
}