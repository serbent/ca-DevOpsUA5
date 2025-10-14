package main 
import "fmt"

type User struct {
	Username string
	Password string
}

func (u *User) printUser() {
	fmt.Println("Username:", u.Username)
	fmt.Println("Password:", u.Password)
}

func (u *User) setUsername(username string){
	u.Username = username
}

func (u *User) setPassword( password string){
	u.Password = password
}

func main() {
	user := User{Username: "admin", Password: "password123"}
	fmt.Println("User:", user)
	user.printUser()

	user.setUsername("newadmin")
	user.setPassword("newpassword456")
	fmt.Println("Updated User:", user)
	user.printUser()
}