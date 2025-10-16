package main 
import "fmt"


type geometry interface {
	area() float64
	perimeter() float64
}

type rect struct {
	width, height float64
}

type circle struct {
	radius float64
}

func (r rect) area() float64 {
	return r.width * r.height
}

func (r rect) perimeter() float64 {
	return 2 * (r.width + r.height)
}

func (c circle) area() float64 {
	return 3.14 * c.radius * c.radius
}

func (c circle) perimeter() float64 {
	return 2 * 3.14 * c.radius
}

func measure(g geometry) {
	fmt.Println("The struc:",g)
	fmt.Println("Area:", g.area())
	fmt.Println("Perimeter:", g.perimeter())
}

func main() {
	r := rect{width: 10, height: 5}
	c := circle{radius: 7}

	measure(r)
	measure(c)
}