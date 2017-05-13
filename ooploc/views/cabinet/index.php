<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
    <div class="container">
        <div class="row">

            <h3>Кабинет пользователя</h3>
            
            <h4>Приветcтвуем Вас, <?=$user['name'];?>! Вперёд за покупками!</h4>
            <ul>
            <?php if ($user['role'] == 'admin'): ?>
                <li><a href="/admin/">Админпанель</a></li>
            <?php endif;?>
                <li><a href="/catalog/">Каталог товаров</a></li>
                <li><a href="/cabinet/edit">Редактировать данные</a></li>
                <!--<li><a href="/cabinet/history">Список покупок</a></li>-->
            </ul>
            
        </div>
    </div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>