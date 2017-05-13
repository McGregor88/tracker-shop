<?php

/**
 * Класс Order - модель для работы с заказами
 */
class Order extends Db
{
    
    protected static $table = 'order';

    /**
     * Сохранение заказа 
     * @param string $userName <p>Имя</p>
     * @param string $userPhone <p>Телефон</p>
     * @param string $userComment <p>Комментарий</p>
     * @param integer $userId <p>id пользователя</p>
     * @param array $products <p>Массив с товарами</p>
     * @param integer $orderId <p>id Заказа</p>
     * @param integer $productId <p>id товара</p>
     * @param integer $productCount <p>Количество товаров</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function save($userName, $userPhone, $userComment, $userId, $products)
    {         
            // Текст запросов к БД
            $sql = self::SAVE_ORDER;
            $sql2 = self::SAVE_PRODUCTS_BY_ORDER;

            $result = self::$db->prepare($sql);
            $result->bindParam(':user_name', $userName, PDO::PARAM_STR);
            $result->bindParam(':user_phone', $userPhone, PDO::PARAM_STR);
            $result->bindParam(':user_comment', $userComment, PDO::PARAM_STR);
            $result->bindParam(':user_id', $userId, PDO::PARAM_STR);    
            $result->execute();
            
            $orderId = self::$db->lastInsertId();  
             
            $result2 = self::$db->prepare($sql2);           
            
            foreach ($products as $productId => $productCount) { 
                
                $result2->bindParam(':order_id', $orderId, PDO::PARAM_INT);         
                $result2->bindParam(':product_id', $productId, PDO::PARAM_INT);
                $result2->bindParam(':product_count', $productCount, PDO::PARAM_INT);        
                $result2->execute();
            }
            return $result2;
    } 
          
    /**
     * Возвращает список заказов
     * @return array <p>Список заказов</p>
     */
    public static function getOrdersList()
    {

        // Получение и возврат результатов
        $result = self::$db->query(self::GET_ORDER_LIST);
        $ordersList = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $ordersList[$i]['id'] = $row['id'];
            $ordersList[$i]['user_name'] = $row['user_name'];
            $ordersList[$i]['user_phone'] = $row['user_phone'];
            $ordersList[$i]['date'] = $row['date'];
            $ordersList[$i]['status'] = $row['status'];
            $i++;
        }
        return $ordersList;
    }
    
    /**
     * Возвращает заказ с указанным orderId 
     * @param integer $orderId <p>id</p>
     * @return array <p>Массив с информацией о продукте и количестве</p>
     */
    public static function getArrayOrderById($orderId)
    {

        // Текст запроса к БД
        $sql = self::GET_LIST_ID_COUNT_ORDER;

        $result = self::$db->prepare($sql);
        $result->bindParam(':order_id', $orderId, PDO::PARAM_INT);

        // Указываем, что хотим получить данные в виде массива
        $result->setFetchMode(PDO::FETCH_ASSOC);

        // Выполняем запрос
        $result->execute();
        $categoryList = array();
        
        while ($row = $result->fetch()) {
            $i = $row['product_id'];
            $categoryList[$i] = $row['product_count'];           
            $i++;
        }
        
        return $categoryList;

    }
    
    public static function getArrayIdByOrderId($orderId)
    {

        // Текст запроса к БД
        $sql = self::GET_LIST_ID_ORDER;

        $result = self::$db->prepare($sql);
        $result->bindParam(':order_id', $orderId, PDO::PARAM_INT);

        // Указываем, что хотим получить данные в виде массива
        $result->setFetchMode(PDO::FETCH_ASSOC);

        // Выполняем запрос
        $result->execute();

        // Возвращаем данные
        return $result->fetchAll();
    }
    

    /**
     * Возвращает текстое пояснение статуса для заказа :<br/>
     * <i>1 - Новый заказ, 2 - В обработке, 3 - Доставляется, 4 - Закрыт</i>
     * @param integer $status <p>Статус</p>
     * @return string <p>Текстовое пояснение</p>
     */
    public static function getStatusText($status) {
        switch ($status) {
            case '1':
                return 'Новый заказ';
                break;
            case '2':
                return 'В обработке';
                break;
            case '3':
                return 'Доставляется';
                break;
            case '4':
                return 'Закрыт';
                break;
        }
    }

    /**
     * Возвращает заказ с указанным id 
     * @param integer $id <p>id</p>
     * @return array <p>Массив с информацией о заказе</p>
     */
    public static function getOrderById($id)
    {
        
        // Текст запроса к БД
        $sql = self::GET_ORDER;

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
     * Удаляет заказ с заданным id
     * @param integer $id <p>id заказа</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function deleteOrderById($id)
    {

        // Текст запроса к БД
        $sql = self::DEL_ORDER;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        return $result->execute();
    }

    /**
     * Редактирует заказ с заданным id
     * @param integer $id <p>id товара</p>
     * @param string $userName <p>Имя клиента</p>
     * @param string $userPhone <p>Телефон клиента</p>
     * @param string $userComment <p>Комментарий клиента</p>
     * @param string $date <p>Дата оформления</p>
     * @param integer $status <p>Статус <i>(включено "1", выключено "0")</i></p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function updateOrderById($id, $userName, $userPhone, $userComment, $date, $status)
    {

        // Текст запроса к БД
        $sql = self::UPDATE_ORDER;
        
        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->bindParam(':user_name', $userName, PDO::PARAM_STR);
        $result->bindParam(':user_phone', $userPhone, PDO::PARAM_STR);
        $result->bindParam(':user_comment', $userComment, PDO::PARAM_STR);
        $result->bindParam(':date', $date, PDO::PARAM_STR);
        $result->bindParam(':status', $status, PDO::PARAM_INT);
        return $result->execute();
    }

}
