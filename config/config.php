<?php
error_reporting( 0 );  # esconde os erros
// error_reporting( E_ALL );  # mostra todos os erros
// error_reporting( E_ALL ^E_NOTICE ); # mostra todos os erros menos notice

ob_start(); # Turns on output buffering
session_start();

$timezone = date_default_timezone_set("America/Sao_Paulo");

$con = mysqli_connect("localhost", "root", "", "social_network"); // Connection variable

if (mysqli_connect_errno()) {
    echo "Failed to connect:" . mysqli_connect_errno();
}
