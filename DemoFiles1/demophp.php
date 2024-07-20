<!DOCTYPE html>
<html>
<body>

<form method="post">
    Radius: <input type="text" name="radius">
    <input type="submit">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $radius = $_POST['radius'];
    $area = pi() * $radius * $radius;
    echo "The area of the circle is: " . $area;
}
?>

</body>
</html>
