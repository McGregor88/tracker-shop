<?php

/**
 * Класс Db
 * Компонент для работы с базой данных
 */
class Db {
    
   const GET_CATEGORY_LIST = ' SELECT
                                                         *
                                                      FROM
                                                         `category`
                                                      WHERE
                                                         `status` = 1 ';

    const GET_CATEGORY_LIST_ADMIN = ' SELECT
                                                                      `id`, `name`, `parent_id`, `sort_order`, `status`
                                                                  FROM
                                                                      `category`
                                                                  ORDER BY
                                                                      `sort_order` ASC ';

    const DEL_CATEGORY = ' DELETE FROM `category` WHERE `id` = :id ';

    const UPDATE_CATEGORY =  ' UPDATE 
                                                        `category`
                                                     SET 
                                                        `name` = :name,
                                                        `parent_id` = :parent_id, 
                                                        `sort_order` = :sort_order, 
                                                        `status` = :status
                                                     WHERE 
                                                        `id` = :id ';

    const GET_CATEGORY = ' SELECT * FROM `category` WHERE `id` = :id ';

    const CREATE_CATEGORY =  ' INSERT INTO
                                                        `category` (`name`, `parent_id`, `sort_order`, `status`)
                                                     VALUES
                                                         (:name, :parent_id, :sort_order, :status) ';
    
    const GET_LATEST_PRODUCTS = ' SELECT 
                                                               `id`, `name`, `price`, `is_new`
                                                           FROM
                                                               `product`
                                                           WHERE
                                                               `status` = "1"
                                                           ORDER BY
                                                               `id` DESC
                                                           LIMIT :count ';
    
    const GET_PRODUCTS_BY_CAT =  ' SELECT 
                                                                `product`.`id`, 
                                                                `product`.`name`, 
                                                                `product`.`price`, 
                                                                `product`.`is_new` 
                                                             FROM 
                                                                `product` 
                                                             INNER JOIN 
                                                                `product_category` 
                                                             ON 
                                                                `product_category`.`product_id` = `product`.`id` 
                                                             INNER JOIN 
                                                                `category` 
                                                             ON 
                                                                `category`.`id` = `product_category`.`category_id`
                                                             WHERE
                                                                `product`.`status` = 1 
                                                             AND 
                                                                `category_id` = :category_id 
                                                             ORDER BY
                                                                `id` ASC 
                                                             LIMIT :limit OFFSET :offset ';
    
    const GET_PRODUCT_BY_ID = ' SELECT * FROM `product` WHERE `id` = :id ';
    
    const GET_ALL_PRODUCTS_IN_CAT = ' SELECT
                                                                     count(`product`.`id`)
                                                                 AS count
                                                                 FROM
                                                                     `product`, `category`
                                                                 WHERE
                                                                     `product`.`status` = "1"
                                                                AND
                                                                     `category`.`id` = :category_id ';
    
    const GET_RECOMMENDED_PRODUCTS = ' SELECT
                                                                            `id`, `name`, `price`, `is_new`
                                                                        FROM
                                                                            `product`
                                                                        WHERE
                                                                            `status` = "1"
                                                                        AND
                                                                            `is_recommended` = "1"
                                                                        ORDER BY
                                                                            `id` DESC ';
    
    const GET_PRODUCT_LIST = ' SELECT `id`, `name`, `price`, `code` FROM `product` ORDER BY `id` ASC ';
    
    const DEL_PRODUCT =  ' DELETE FROM `product` WHERE `id` = :id ';

    const UPDATE_PRODUCT =  ' UPDATE 
                                                      `product`
                                                  SET 
                                                      `name` = :name, 
                                                      `code` = :code, 
                                                      `price` = :price, 
                                                      `brand` = :brand, 
                                                      `availability` = :availability, 
                                                      `description` = :description, 
                                                      `is_new` = :is_new, 
                                                      `is_recommended` = :is_recommended, 
                                                      `status` = :status
                                                   WHERE 
                                                      `id` = :id ';
    
    const CREATE_PRODUCT = ' INSERT INTO 
                                                     `product` (`name`, `code`, `price`, `brand`, `availability`, `description`, `is_new`, `is_recommended`, `status`)
                                                  VALUES
                                                      (:name, :code, :price, :brand, :availability, :description, :is_new, :is_recommended, :status) ';
    
    const CREATE_USER = ' INSERT INTO
                                                    `user` (`name`, `email`, `password`)
                                                  VALUES (:name, :email, :encrypted_password) ';
    
    const UPDATE_USER = ' UPDATE 
                                              `user` 
                                           SET 
                                               `name` = :name,
                                               `password` = :password 
                                           WHERE 
                                               `id` = :id ';
    
    const CHECK_USER_DATA = ' SELECT * FROM `user` WHERE `password` = :password ';
    
    const CHECK_USER_BY_PWD = ' SELECT * FROM `user` WHERE `password` = :password ';
    
    const CHECK_EMAIL_EXISTS = ' SELECT COUNT(*) FROM `user` WHERE `email` = :email ';
    
    const GET_USER = ' SELECT * FROM `user` WHERE `id` = :id ';
    
    const GET_USER_BY_EMAIL = ' SELECT * FROM `user` WHERE `email` = :email ';
    
    const SAVE_ORDER = ' INSERT INTO
                                            `orders` (`user_name`, `user_phone`, `user_comment`, `user_id`)
                                         VALUES 
                                             (:user_name, :user_phone, :user_comment, :user_id) ';
    
    const SAVE_PRODUCTS_BY_ORDER = ' INSERT INTO
                                                               `order_products` (`order_id`, `product_id`, `product_count`)
                                                            VALUES
                                                                (:order_id, :product_id, :product_count) ';
    
    const GET_ORDER_LIST = 'SELECT
                                                  `id`, `user_name`, `user_phone`, `date`, `status`
                                              FROM
                                                  `orders`
                                              ORDER BY
                                                  `id` DESC ';
    
    const GET_LIST_ID_COUNT_ORDER = 'SELECT
                                                                    `product_id`, `product_count`
                                                                FROM
                                                                    `order_products`
                                                                WHERE
                                                                    `order_id` = :order_id   ';
    
    const GET_LIST_ID_ORDER = 'SELECT
                                                       `product_id`
                                                    FROM
                                                        `order_products`
                                                    WHERE
                                                         `order_id` = :order_id   ';

    const GET_ORDER =  ' SELECT * FROM `orders` WHERE `id` = :id ';
    
    const DEL_ORDER =  ' DELETE FROM `orders` WHERE `id` = :id ';
    
    const UPDATE_ORDER = ' UPDATE 
                                                `product_order`
                                             SET 
                                                `user_name` = :user_name, 
                                                `user_phone` = :user_phone, 
                                                `user_comment` = :user_comment, 
                                                `date` = :date, 
                                                `status` = :status 
                                             WHERE 
                                                 `id` = :id '; 
    
    protected static $table = '';

    static $db;

    function __construct ( $args = []) {

        foreach ($args as $key => $value) {
            if (property_exists(get_called_class(), $key)) {
                $this->$key = $value;
            }
        }
    }

    function __get($name) {
        if (property_exists(self::class, $name)) {
            return $this->$name;
        }

        if (method_exists($this, $method = 'get' . ucfirst($name))) {
            return $this->$method();
        }

        return null;
    }

    static function getDb($id) {

        $Class = get_called_class();

        if (empty($table = $Class::$table)) {
            return null;
        }

        $query = self::$db->prepare("SELECT * FROM $table WHERE `id` = :id");

        $query->execute(['id' => $id]);

        $res = $query->fetch(PDO::FETCH_ASSOC);

        return ($res)? new $Class($res) : null;

    }
}

// Получаем параметры подключения из файла    
$paramsPath = ROOT . '/config/db_params.php';
$params = include($paramsPath);
$dsn = "mysql:host={$params['host']};dbname={$params['dbname']}";

Db::$db = new PDO($dsn, $params['user'], $params['password']);
