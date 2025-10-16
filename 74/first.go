package main 

import "fmt"

type rect struct {
	width, height int
}

func (r rect) area() int {
	return r.width * r.height
}

func (r rect) perimeter() int {
	return 2 * (r.width + r.height)
}

func main() {
	r := rect{width: 10, height: 5}
	v := rect{width: 35, height: 45}

	rp := &r

	fmt.Println("Area of rectangle:", r.area(), "", v.area())
	fmt.Println("Perimeter of rectangle:", r.perimeter(), "", v.perimeter())

	fmt.Println("area: ", rp.area())
	fmt.Println("perimeter: ", rp.perimeter())
}