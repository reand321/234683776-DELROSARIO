import math

def calculate_area(radius):
    return math.pi * radius * radius

radius = float(input("Enter the radius of the circle: "))
area = calculate_area(radius)
print(f"The area of the circle is: {area}")
