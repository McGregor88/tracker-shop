<?php

/**
 * Контроллер CartController
 */
class SiteController
{

    /**
     * Action для главной страницы
     */
    public function actionIndex()
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();
        $categoriesTree = Category::mapTree($categories);
        $categoriesMenu = Category::categoriesToString($categoriesTree);

        
        // Список последних товаров
        $latestProducts = Product::getLatestProducts(9);

        // Список товаров для слайдера
        $sliderProducts = Product::getRecommendedProducts();

        // Подключаем вид
        require_once(ROOT . '/views/site/index.php');
        return true;
    }

    /**
     * Action для страницы "Контакты"
     */
    public function actionContacts() {
        // Подключаем вид
        require_once(ROOT . '/views/site/contacts.php');
        return true;
    }
    
    /**
     * Action для страницы "О магазине"
     */
    public function actionAbout() {
        // Подключаем вид
        require_once(ROOT . '/views/site/about.php');
        return true;
    }

    /**
     * Action для страницы "Доставка"
     */
    public function actionDelivery() {
        // Подключаем вид
        require_once(ROOT . '/views/site/delivery.php');
        return true;
    }

    /**
     * Action для страницы "Оплата"
     */
    public function actionPayment() {
        // Подключаем вид
        require_once(ROOT . '/views/site/payment.php');
        return true;
    }

    /**
     * Action для страницы "Условия возврата"
     */
    public function actionGoods_back() {
        // Подключаем вид
        require_once(ROOT . '/views/site/goods_back.php');
        return true;
    }

    /**
     * Action для страницы "Пункты выдачи"
     */
    public function actionOutpost() {
        // Подключаем вид
        require_once(ROOT . '/views/site/outpost.php');
        return true;
    }

    /**
     * Action для страницы "Акции"
     */
    public function actionActions() {
        // Подключаем вид
        require_once(ROOT . '/views/site/actions.php');
        return true;
    }

    /**
     * Action для страницы "Распродажа"
     */
    public function actionSale() {
        // Подключаем вид
        require_once(ROOT . '/views/site/sale.php');
        return true;
    }

    /**
     * Action для страницы "Поддержка"
     */
    public function actionSupport() {
        
        // Переменные для формы
        $userEmail = false;
        $userText = false;
        $result = false;

        // Обработка формы
        if (isset($_POST['submit'])) {
            // Если форма отправлена 
            // Получаем данные из формы
            $userEmail = $_POST['userEmail'];
            $userText = $_POST['userText'];

            // Флаг ошибок
            $errors = false;

            // Валидация полей
            if (!User::checkEmail($userEmail)) {
                $errors[] = 'Неправильный email';
            }

            if ($errors == false) {
                // Если ошибок нет
                // Отправляем письмо администратору 
                $adminEmail = 'tracker.shop@gmail.com';
                $message = "Текст: {$userText}. От {$userEmail}";
                $subject = 'Тема письма';
                $result = mail($adminEmail, $subject, $message);
                $result = true;
            }
        }

        // Подключаем вид
        require_once(ROOT . '/views/site/support.php');
        return true;
    }

}
