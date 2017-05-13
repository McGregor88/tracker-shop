<?php

/**
 * Класс Category - модель для работы с категориями товаров
 */
class Category extends Db 
{
  
    protected static $table = 'category';
    
    /**
     * Возвращает массив категорий для списка на сайте
     * @return array <p>Массив с категориями</p>
     */
    public static function getCategoriesList() {

        // Запрос к БД
        $result = self::$db->query(self::GET_CATEGORY_LIST);

        // Получение и возврат результатов
        
        $categoryList = array();
        while ($row = $result->fetch()) {
            $i = $row['id'];
            $categoryList[$i]['id'] = $row['id'];
            $categoryList[$i]['name'] = $row['name'];
            $categoryList[$i]['parent_id'] = $row['parent_id'];
            $i++;
        }
        return $categoryList;
    }
 
    /**
     * Построение дерева
     * @return array <p>Дерево массив</p>
     */
    public static function mapTree($dataset) 
    {
        
        $tree = array();
        
        foreach ($dataset as $id => &$node) {
            if(!$node['parent_id']) {
                $tree[$id] = &$node;
            } else {
                $dataset[$node['parent_id']]['childs'][$id] = &$node;
            }
        }
        
        return $tree;
    }
    
    /**
     * Дерево в строку HTML
     * 
     */
    public static function categoriesToString($tree) 
    {
        $string = '';
        foreach ($tree as $item) {        
            $string .= self::categoriesToTemplate($item);          
        }
        return $string;
     }
    
    /**
     * Шаблон вывода категорий
     *
     */
    
    public static function categoriesToTemplate($category) 
    {
        ob_start();
        require '/components/CategoryTemplate.php';
        return ob_get_clean();
    }
  
    /**
     * Возвращает массив категорий для списка в админпанели <br/>
     * (при этом в результат попадают и включенные и выключенные категории)
     * @return array <p>Массив категорий</p>
     */
    public static function getCategoriesListAdmin() 
    {

        // Запрос к БД
        $result = self::$db->query(self::GET_CATEGORY_LIST_ADMIN);

        // Получение и возврат результатов
        $categoryList = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $categoryList[$i]['id'] = $row['id'];
            $categoryList[$i]['name'] = $row['name'];
            $categoryList[$i]['parent_id'] = $row['parent_id'];
            $categoryList[$i]['sort_order'] = $row['sort_order'];
            $categoryList[$i]['status'] = $row['status'];
            $i++;
        }
        return $categoryList;
    }

    /**
     * Удаляет категорию с заданным id
     * @param integer $id
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function deleteCategoryById($id) 
    {

        // Текст запроса к БД
        $sql = self::DEL_CATEGORY;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        return $result->execute();
    }

    /**
     * Редактирование категории с заданным id
     * @param integer $id <p>id категории</p>
     * @param string $name <p>Название</p>
     * @param integer $parentId <p>Номер родителя</p>
     * @param integer $sortOrder <p>Порядковый номер</p>
     * @param integer $status <p>Статус <i>(включено "1", выключено "0")</i></p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function updateCategoryById($id, $name, $parentId, $sortOrder, $status)
    {

        // Текст запроса к БД
        $sql = self::UPDATE_CATEGORY;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->bindParam(':name', $name, PDO::PARAM_STR);
        $result->bindParam(':parent_id', $parentId, PDO::PARAM_INT);
        $result->bindParam(':sort_order', $sortOrder, PDO::PARAM_INT);
        $result->bindParam(':status', $status, PDO::PARAM_INT);
        return $result->execute();
    }

    /**
     * Возвращает категорию с указанным id
     * @param integer $id <p>id категории</p>
     * @return array <p>Массив с информацией о категории</p>
     */
    public static function getCategoryById($id) {

        // Текст запроса к БД
        $sql = self::GET_CATEGORY;

        // Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);

        // Указываем, что хотим получить данные в виде массива
        $result->setFetchMode(PDO::FETCH_ASSOC);

        // Выполняем запрос
        $result->execute();

        // Возвращаем данные
        return $result->fetch();
    }

    /**
     * Возвращает текстое пояснение статуса для категории :<br/>
     * <i>0 - Скрыта, 1 - Отображается</i>
     * @param integer $status <p>Статус</p>
     * @return string <p>Текстовое пояснение</p>
     */
    public static function getStatusText($status) {
        switch ($status) {
            case '1':
                return 'Отображается';
                break;
            case '0':
                return 'Скрыта';
                break;
        }
    }

    /**
     * Добавляет новую категорию
     * @param string $name <p>Название</p>
     * @param integer $parentId <p>Номер родителя</p>
     * @param integer $sortOrder <p>Порядковый номер</p>
     * @param integer $status <p>Статус <i>(включено "1", выключено "0")</i></p>
     * @return boolean <p>Результат добавления записи в таблицу</p>
     */
    public static function createCategory($name, $parentId, $sortOrder, $status) 
    {

        // Текст запроса к БД
        $sql = self::CREATE_CATEGORY;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':name', $name, PDO::PARAM_STR);
        $result->bindParam(':parent_id', $parentId, PDO::PARAM_INT);
        $result->bindParam(':sort_order', $sortOrder, PDO::PARAM_INT);
        $result->bindParam(':status', $status, PDO::PARAM_INT);
        return $result->execute();
    }

}
