<?php

class Hirek_Controller
{
    public $baseName = 'hirek';

    public function main(array $vars)
    {
        $hirek_model = new Hirek_Model();
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cim']) && isset($_POST['bevezeto']) && isset($_POST['torzs'])) {
            $cim = $_POST['cim'];
            $bevezeto = $_POST['bevezeto'];
            $torzs = $_POST['torzs'];
            $felhasznaloId = $_SESSION['userid'];

            try {
                $sikeresMentes = $hirek_model->hirMentes($cim, $bevezeto, $torzs, $felhasznaloId);
                if ($sikeresMentes) {
                    echo "Sikeres mentés! Frissítse az oldalt.";
                    exit();
                } else {
                    echo "Hiba történt a mentés során!";
                }
            } catch (PDOException $e) {
                echo "Hiba történt a mentés során: " . $e->getMessage();
            }
        }

        $aloldal = isset($vars[0]) ? $vars[0] : "index";
        $hirek_model = new Hirek_Model();
        if ($aloldal == 'index') {
            $retData = $hirek_model->index();
            $view = new View_Loader($this->baseName . "_index_main");
            $view->assign('hirek', $retData['hirek']);
        } elseif (is_numeric($aloldal)) {
            $retData = $hirek_model->mutat($aloldal, $_SESSION['userid']);
            $view = new View_Loader($this->baseName . "_mutat_main");
            $view->assign('hir', $retData['hir']);
            $view->assign('velemenyek', $retData['velemenyek']);

            if (isset($retData['hir']['id'])) {
                $hirId = $retData['hir']['id'];

                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    if (isset($_POST['comment']) && !empty($_POST['comment'])) {
                        $felhasznaloId = $_SESSION['userid'];
                        $szoveg = $_POST['comment'];

                        try {
                            $hirek_model->hozzaszolasMentes($hirId, $felhasznaloId, $szoveg);
                            // Sikeres mentés
                        } catch (PDOException $e) {
                            // Hiba a mentés során
                            echo "Hiba történt a mentés során: " . $e->getMessage();
                        }
                    } else {
                        echo "Hiba: Hozzászólás üres!";
                    }
                }
            } else {
                echo "Hiba: 'hir' kulcs hiányzik a visszatérített adatokból!";
            }
        } else {
            echo "Hiba!";
        }
    }
}

?>
