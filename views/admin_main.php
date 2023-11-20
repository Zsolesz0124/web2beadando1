<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <h3>Az utolsó 12db rendelés</h3>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Pizza neve</th>
                    <th scope="col">Darab szám</th>
                    <th scope="col">Felvétel</th>
                    <th scope="col">Kiszállítás</th>
                </tr>
                </thead>
                <tbody>
                <?php echo Menu::getRendeles() ?>
                </tbody>
            </table>
        </div>
    </div>
</section>