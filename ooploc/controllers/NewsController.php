<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Контроллер NewsController
 */
class NewsController
{
    /**
     * Action для главной страницы
     */
    public function actionIndexNews()
    {
        // Подключаем вид
        require_once(ROOT . '/views/news/index.php');
        return true;
    }
    
    /**
     * Action для архива
     */
    public function actionArchiveNews()
    {
        // Подключаем вид
        require_once(ROOT . '/views/news/archive.php');
        return true;
    }
    
    
}