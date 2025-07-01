# import addional

# addional.hello_world()

from addional import *

hello_world()

object = Additional()

objPerson = Person("Alice")
objAnotherPerson = Person("Bob")

objPerson.greet()
objAnotherPerson.greet()

object.greet()

objAnotherPerson.age(26)
objAnotherPerson.hight(180)

objPerson.age(input("Enter age for Alice: "))
objPerson.hight(input("Enter height for Alice: "))

print(objPerson)
print(objAnotherPerson)
print(repr(objPerson))
print(repr(objAnotherPerson))

Cyborg1 = Cyborg("T-800", ["super strength", "flight"])   
Cyborg2 = Cyborg("R2-D2", ["hacking", "repair"])

Cyborg1.manufacturer = "SkyNet"
Cyborg2.manufacturer = "Galactic Empire"

print(Cyborg1)
print(Cyborg2)