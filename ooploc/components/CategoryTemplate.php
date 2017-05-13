<li>
    <a href="/category/<?=$category['id']?>"><?=$category['name']?></a>
    <?php if(isset($category['childs'])): ?>
    <ul class="link">
        <?=self::categoriesToString($category['childs'])?>
    </ul>
    <?php endif; ?>
</li>


