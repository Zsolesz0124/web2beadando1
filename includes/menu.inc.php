<?php

Class Menu {
    public static $menu = array();
    
    public static function setMenu() {
        self::$menu = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("select url, nev, szulo, jogosultsag from menu where jogosultsag like '".$_SESSION['userlevel']."'order by sorrend");
        while($menuitem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$menu[$menuitem['url']] = array($menuitem['nev'], $menuitem['szulo'], $menuitem['jogosultsag']);
        }
    }

    public static function getMenu($sItems) {
        $submenu = "";

        $menu = "<ul class='navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4'>";
        foreach(self::$menu as $menuindex => $menuitem)
        {
            if($menuitem[1] == "")
            { $menu.= "<li class='nav-item'><a href='".SITE_ROOT.$menuindex."' class='nav-link active'>".$menuitem[0]."</a></li>"; }
           }
        $menu.="</ul>";

        if($submenu != "")
            $submenu = "<ul>".$submenu."</ul>";

        return $menu.$submenu;
    }

    public static $pizzas = array();
    public static $pizzacategory = array();

    public static $rendelesek = array();

    public static function setPizzas() {
        self::$pizzas = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("select nev, kategorianev, vegetarianus from pizzak");
        while($pizzaitem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$pizzas[$pizzaitem['nev']] = array($pizzaitem['nev'], $pizzaitem['kategorianev'], $pizzaitem['vegetarianus']);
        }
    }

    public static function setPizzacategory() {
        self::$pizzacategory = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("select nev, ar from pizzakategoriak");
        while($pizzacatitem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$pizzacategory[$pizzacatitem['nev']] = array($pizzacatitem['nev'], $pizzacatitem['ar']);
        }
    }
    public static function setRendelesek() {
        self::$rendelesek = array();
        $connection = Database::getConnection();
        $stmt = $connection->query("select pizzanev, darab, felvetel, kiszallitas from rendeles");
        while($rendelesitem = $stmt->fetch(PDO::FETCH_ASSOC)) {
            self::$rendelesek[$rendelesitem['pizzanev']] = array($rendelesitem['pizzanev'], $rendelesitem['darab'], $rendelesitem['felvetel'], $rendelesitem['kiszallitas']);
        }
    }


    public static function getPizzas() {
        $submenu = "";

        $menu = "";
        foreach(self::$pizzas as $menuindex => $pizzaitem)
        {
            $kategoria = $pizzaitem[1];
            $tipus = 'Vegetáriánus';
            $ar = 0;
            foreach(self::$pizzacategory as $pizzaindex => $pizzacat)
            {
                if ($pizzacat[0] == $kategoria){
                    $ar = $pizzacat[1];
                }
            }
            if ($pizzaitem[2] == '0'){
                $tipus = 'Nem vegetáriánus';
            }
            $menu.= "<div class='col mb-5'><div class='card h-100'><img class='card-img-top' src='https://ogden_images.s3.amazonaws.com/www.motherearthnews.com/images/2011/12/22113149/flickr-Bradley-Hawks-450x300.jpg' alt='pizza1' /><div class='card-body p-4'><div class='text-center'><h5 class='fw-bolder'>$menuindex</h5>Kategória: $kategoria</div><div class='text-center'><h5>$tipus</h5>$ar Ft</div></div><div class='card-footer p-4 pt-0 border-top-0 bg-transparent'></div></div></div>";
        }
        $menu.="";

        if($submenu != "")
            $submenu = "".$submenu."";

        return $menu.$submenu;
    }

    public static function getRendeles() {
        $submenu = "";

        $menu = "";
        foreach(self::$rendelesek as $menuindex => $rendelesitem)
        {
            $menu.= "<tr><th scope='row'>$rendelesitem[0]</th><td>$rendelesitem[1]</td><td>$rendelesitem[2]</td><td>$rendelesitem[3]</td></tr>";
        }
        $menu.="";

        if($submenu != "")
            $submenu = "".$submenu."";

        return $menu.$submenu;
    }



}
Menu::setPizzas();
Menu::setRendelesek();
Menu::setPizzacategory();
Menu::setMenu();
?>
