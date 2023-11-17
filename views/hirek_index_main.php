<div class="container" style="padding: 20px; background-color: #f5f5f5; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;">
    <?php if ($_SESSION['userid']) { ?>
        <?php foreach ($viewData['hirek'] as $hir) { ?>
            <article class="hir">
                <h1><a href="<?php echo SITE_ROOT ?>hirek/<?php echo $hir['id']; ?>"><?php echo $hir['cim']; ?></a></h1>
                <p><?php echo $hir['bejelentkezes']; ?> - <?php echo $hir['ido']; ?></p>
                <p><?php echo $hir['bevezeto']; ?></p>
            </article>
        <?php } ?>
        <form method="post" action="/web2/hirek">
            <div class="container">
                <label for="cim" class="form-label">Hír címe</label>
                <input type="text" class="form-control mb-3" name="cim" id="cim" />

                <label for="bevezeto" class="form-label">Bevezető</label>
                <textarea class="form-control mb-3" name="bevezeto" id="bevezeto" rows="3"></textarea>

                <label for="torzs" class="form-label">Hír szövege</label>
                <textarea class="form-control mb-3" name="torzs" id="torzs" rows="6"></textarea>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-outline-primary text-center">Küldés</button>
                </div>
            </div>
        </form>
    <?php } else { ?>
        <p>A híreink megtekintéséhez kérem <a href="/web2/belepes">jelentkezzen be</a>.</p>
    <?php } ?>
</div>
