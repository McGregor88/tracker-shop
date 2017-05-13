<?php include ROOT . '/views/layouts/header.php'; ?>

<h4>НОВОСТИ</h4><hr>

<?php
$categories = Category::getCategoriesList();

foreach ($categories as $item) {
    $item['subs'] = array();
    $indexedItems[$item['id']] = (object) $item;
}

$topLevel = array();
foreach ($indexedItems as $item) {
    if ($item->parent_id == 0) {
        $topLevel[] = $item;
    } else {
        $indexedItems[$item->parent_id]->subs[] = $item;
    }
}

function renderMenu($categories) {
    $render = '<ul>';

    foreach ($categories as $item) {
        $render .= '<li>' . $item->name;
        if (!empty($item->subs)) {
            $render .= renderMenu($item->subs);
        }
        $render .= '</li>';
    }
    return $render . '</ul>';
}
echo renderMenu($topLevel);

?>

<?php include ROOT . '/views/layouts/footer.php'; 
