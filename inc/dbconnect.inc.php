<?php
  
    class DbCon {
        
            private $servername = "ben";
            private $username = "root";
            private $password = "";
            private $dbname = "rehoboth";
            
            
            public function connect() {
            
            // Connexion a la BDD en utilisant PDO
            try {
                //Tentative de connexion
        
                $cnn = new PDO('mysql:host=' . $this->servername . '; dbname=' . $this->dbname, $this->username, $this->password);
                //$cnn= new PDO('mysql:host=' .HOST. ';port=' .PORT. ';dbname=' .DATA. ';charset=utf8', USER, PASS);
        
                //Affecte les attributs à la connexion
                $cnn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                // $cnn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
                return $cnn;
            } catch (PDOException $err){
                //Si erreur de connexion
                echo 'Database Error' . $err->getMessage();
            }
        }
    } 
 ?>
