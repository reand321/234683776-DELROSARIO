@echo off

REM prompt
echo Select one of the shapes you want
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral

choice /c 123 /m "Choose "
if errorlevel 3 goto quad
if errorlevel 2 goto tri
if errorlevel 1 goto cir

:cir
set /p radius="Enter the length of the radius:  "
set /a area=%radius% * %radius% * 31416 / 10000
echo The area of the circle is %area%

pause
goto end

:tri

set /p a=Enter the length of side a: 
set /p b=Enter the length of side b: 
set /p c=Enter the length of side c: 

set /a s=(a + b + c) / 2
set /a temp1=s * (s - a)
set /a temp2=temp1 * (s - b)
set /a temp3=temp2 * (s - c)
set /a area=%temp3%

echo The area of the triangle is %area% square units.

if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if %a% neq %c% (
    echo The triangle is isosceles.
) else if %a%==%c% if %a% neq %b% (
    echo The triangle is isosceles.
) else if %b%==%c% if %b% neq %a% (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)

pause
goto end



:quad

set /p l="Enter the length of the quadrilateral: "
set /p w="Enter the width of the quadrilateral: "
set /a area=l * w
echo The area of the quadrilateral is %area% square units.

if %l%==%w% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
pause
goto end

:end
echo Thank you for using this script
pause