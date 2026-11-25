<?php
// Datos de conexión
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "otomi_julieta";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$mensaje_error = "";

// Procesar el formulario cuando el usuario presiona "Iniciar sesión"
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'] ?? '';
    $pass = $_POST['contraseña'] ?? '';

    $stmt = $conn->prepare("SELECT * FROM usuario WHERE email = ? AND contraseña = ?");
    $stmt->bind_param("ss", $email, $pass);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $usuario = $result->fetch_assoc();
        session_start();
        $_SESSION['usuario'] = $usuario['email'];
        $_SESSION['id_usuario'] = $usuario['id_usuario'];
        $_SESSION['nombre'] = $usuario['nombre'];

        echo "<script>
            window.location.href='unidad_animales.html';
        </script>";
        exit();
    } else {
        $mensaje_error = "Correo o contraseña incorrectos.";
    }
    $stmt->close();
}
$conn->close();
?>
