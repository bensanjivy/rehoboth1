<?php 
    require '../rehoboth/INC/dbconnect.inc.php';
    function loadbooks(){
        $db = new DbCon;
        $cnn = $db->connect();

        $stmt = $cnn->prepare("select * from rehoboth.r_booknames b");
        $stmt->execute();
        $booknames = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $booknames;
    }

    if(isset($_POST['bid'])) {
        $db = new DbCon;
        $cnn = $db->connect();

        $stmt = $cnn->prepare("select * from r_chapter c where r_booknames_bookname_pkey = " . $_POST['bid']);
        $stmt->execute();
        $r_chapter = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($r_chapter);
    }

    function loadchapter(){
        $db = new DbCon;
        $cnn = $db->connect();

        $stmt = $cnn->prepare("select * from rehoboth.r_chapter c");
        $stmt->execute();
        $chapternames = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $chapternames;
    }

    if(isset($_POST['cid'])) {
        $db = new DbCon;
        $cnn = $db->connect();

        $stmt = $cnn->prepare("select * from r_verses v where v.r_chapter_chapter_pkey = " . $_POST['cid']);
        $stmt->execute();
        $r_verses = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($r_verses);
    }


    function loadverses(){
        $db = new DbCon;
        $cnn = $db->connect();

        $stmt = $cnn->prepare("select * from rehoboth.r_verses v");
        $stmt->execute();
        $verses = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $verses;
    }
   
    function loadversetext(){
        $db = new DbCon;
        $cnn = $db->connect();

         $bookname = $_POST['r_chapter'];
         $verseID = $_POST['r_verses'];
        $sql = "select * from r_verses v where v.r_chapter_chapter_pkey = '$bookname' and v.id_verses= '$verseID'";
        // echo $sql;

        $stmt = $cnn->prepare($sql);
        $stmt->execute();
        $versetext = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $versetext;
    }

?>

