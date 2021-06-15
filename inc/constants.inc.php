<?php
    // Constantes liées à la BDD (Base de données)
        switch($_SERVER['HTTP_HOST']) {
            case 'ben':
                case '127.0.0.1':
                    define('HOST', 'ben');
                    define('PORT', 3306);
                    define('DATA', 'rehoboth');
                    define('USER', 'root');
                    define('PASS', '');
                    break;
                default:
                    throw new Exception('Erreur SERVER : les paramèters de connexion sont introuvables.');
        }

?>
