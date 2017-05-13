<?php

/**
 * Класс User - модель для работы с пользователями
 */
class User extends Db
{
    
    protected static $table = 'user';

    /**
     * Регистрация пользователя 
     * @param string $name <p>Имя</p>
     * @param string $email <p>E-mail</p>
     * @param string $password <p>Пароль</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    
    public static function customFunctionForSalt() 
    {
        $salt = 'fdfsd9hHGhjG9f8sf7s6fqe7JHJqe8s65f5sf67fs6fs6';
        return $salt;
    }

    public static function register($name, $email, $password)
    {
        $options = [
            'salt' => self::customFunctionForSalt(),
            'cost' => 12 // the default cost is 10
        ];
        
        $encryptedPassword = password_hash($password, PASSWORD_DEFAULT, $options);

        // Текст запроса к БД
        $sql = self::CREATE_USER;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':name', $name, PDO::PARAM_STR);
        $result->bindParam(':email', $email, PDO::PARAM_STR);
        $result->bindParam(':encrypted_password', $encryptedPassword, PDO::PARAM_STR);
        return $result->execute();
    }

    /**
     * Редактирование данных пользователя
     * @param integer $id <p>id пользователя</p>
     * @param string $name <p>Имя</p>
     * @param string $password <p>Пароль</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function edit($id, $name, $password)
    {

        // Текст запроса к БД
        $sql = self::UPDATE_USER;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->bindParam(':name', $name, PDO::PARAM_STR);
        $result->bindParam(':password', $password, PDO::PARAM_STR);
        return $result->execute();
    }

    /**                     
     * Проверяем существует ли пользователь с заданными $email и $password
     * @param string $email <p>E-mail</p>
     * @param string $encryptedPassword <p>Хэш</p>
     * @param string $password <p>Пароль</p>
     * @return mixed : integer user id or false
     */
    public static function checkUserData($email, $password)
    {
        // Текст запроса к БД
        $sql = self::GET_USER_BY_EMAIL;
        $result = self::$db->prepare($sql);
        
        $result->bindParam(':email', $email, PDO::PARAM_STR);
              
        $result->execute();
        
        $resultOfGetUser = $result->fetch(PDO::FETCH_ASSOC);
                          
        $hashPassword = $resultOfGetUser['password'];
        
        
        if (password_verify($password, $hashPassword)) {
                    
            // Текст запроса к БД
            $sql2 = self::CHECK_USER_BY_PWD;

            // Получение результатов. Используется подготовленный запрос
            $result2 = self::$db->prepare($sql2);
            
            $result2->bindParam(':password', $hashPassword, PDO::PARAM_STR);
            $result2->execute();

            // Обращаемся к записи
            $user = $result2->fetch();
        }
            
            if ($user) {

                // Если запись существует, возвращаем id пользователя
                return $user['id'];
            }
            return false;     
        }
    

    /**
     * Запоминаем пользователя
     * @param integer $userId <p>id пользователя</p>
     */
    public static function auth($userId)
    {
        // Записываем идентификатор пользователя в сессию
        $_SESSION['user'] = $userId;
    }

    /**
     * Возвращает идентификатор пользователя, если он авторизирован.<br/>
     * Иначе перенаправляет на страницу входа
     * @return string <p>Идентификатор пользователя</p>
     */
    public static function checkLogged()
    {
        // Если сессия есть, вернем идентификатор пользователя
        if (isset($_SESSION['user'])) {
            return $_SESSION['user'];
        }

        header("Location: /user/login");
    }

    /**
     * Проверяет является ли пользователь гостем
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function isGuest()
    {
        if (isset($_SESSION['user'])) {
            return false;
        }
        return true;
    }

    /**
     * Проверяет имя: не меньше, чем 2 символа
     * @param string $name <p>Имя</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function checkName($name)
    {
        if (strlen($name) >= 2) {
            return true;
        }
        return false;
    }

    /**
     * Проверяет телефон: не меньше, чем 10 символов
     * @param string $phone <p>Телефон</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function checkPhone($phone)
    {
        if (strlen($phone) >= 10) {
            return true;
        }
        return false;
    }

    /**
     * Проверяет имя: не меньше, чем 6 символов
     * @param string $password <p>Пароль</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function checkPassword($password)
    {
        if (strlen($password) >= 6) {
            return true;
        }
        return false;
    }

    /**
     * Проверяет email
     * @param string $email <p>E-mail</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function checkEmail($email)
    {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return true;
        }
        return false;
    }

    /**
     * Проверяет не занят ли email другим пользователем
     * @param type $email <p>E-mail</p>
     * @return boolean <p>Результат выполнения метода</p>
     */
    public static function checkEmailExists($email)
    {

        // Текст запроса к БД
        $sql = self::CHECK_EMAIL_EXISTS;

        // Получение результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':email', $email, PDO::PARAM_STR);
        $result->execute();

        if ($result->fetchColumn()) {
            return true;
        }
        return false;
    }

    /**
     * Возвращает пользователя с указанным id
     * @param integer $id <p>id пользователя</p>
     * @return array <p>Массив с информацией о пользователе</p>
     */
    public static function getUserById($id)
    {

        // Текст запроса к БД
        $sql = self::GET_USER;

        // Получение и возврат результатов. Используется подготовленный запрос
        $result = self::$db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);

        // Указываем, что хотим получить данные в виде массива
        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute();

        return $result->fetch();
    }

}
