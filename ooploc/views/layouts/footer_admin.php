    <div class="page-buffer"></div>
</div>

<footer id="footer" class="page-footer">
    <div class="mycontainer">
        <div class="footer-top clearfix">
            <div class="footer-logo">
                <img src="/template/images/home/logo2.png" alt="The Great Keksby" width="205" height="55">
            </div>
            <a href="/cart" class="btn btn-quick-order">Корзина</a>
            <a href="/catalog" class="btn btn-quick-order">Каталог</a>
            <a href="/support" class="btn btn-quick-order">Обратная связь</a>
        </div>
        <div class="footer-middle clearfix">
            <div class="footer-menu">
                <h3>Магазин</h3>
                <ul>  
                    <li><a href="#">О нас</a></li>
                    <li><a href="#">Доставка</a></li>
                    <li><a href="#">Оплата</a></li>
                    <li><a href="#">Контакты</a></li>
                    <li><a href="#">Условия возврата</a></li>
                    <li><a href="#">Пункты выдачи</a></li>
                </ul>
            </div>
            <div class="footer-menu">
                <h3>Brands</h3>
                <ul>
                    <li><a href="catalog/9">Jawbone</a></li>
                    <li><a href="catalog/10">Huawei</a></li>
                    <li><a href="catalog/14">Asus</a></li>
                    <li><a href="catalog/15">Belsis</a></li>
                    <li><a href="catalog/16">Runtastic</a></li>
                    <li><a href="catalog/17">Mio</a></li>
                    <li><a href="catalog/18">Fitbit</a></li>
                    <li><a href="catalog/21">Xiaomi</a></li>
                </ul>
            </div>
            <div class="footer-menu">
                <h3>Прайс-лист</h3>
                <ul>
                    <li><a href="#">Скачать прайс</a></li>
                    <li><a href="/sale">Скидки</a></li>
                    <li><a href="/actions">Акции</a></li>
                    <li><a href="#">Отзывы</a></li>
                </ul>
            </div>
        </div>
 
        <div class="footer-bottom clearfix">
            <div class="footer-social">
                <b>Давайте дружить!</b>
                <a class="social-btn" href="https://vk.com/tracker-shop.com"><i class="fa fa-vk fa-2x"></i></a>
                <a class="social-btn" href="https://facebook.com/tracker-shop.com"><i class="fa fa-facebook fa-2x"></i></a>
                <a class="social-btn" href="https://instagram.com/tracker-shop.com"><i class="fa fa-instagram fa-2x"></i></a>
                <a class="social-btn" href="#"><i class="fa fa-twitter fa-2x"></i></a>
                <a class="social-btn" href="#"><i class="fa fa-telegram fa-2x"></i></a>
                <a class="social-btn" href="#"><i class="fa fa-youtube fa-2x"></i></a>
            </div>
            <div class="footer-copyright">
                С <span class="heart">любовью </span><a href="/">Tracker Shop 2017</a>
            </div>
        </div>
    </div>
</footer><!--/Footer-->


<script src="/template/js/jquery.js"></script>
<script src="/template/js/jquery.cycle2.min.js"></script>
<script src="/template/js/jquery.cycle2.carousel.min.js"></script>
<script src="/template/js/bootstrap.min.js"></script>
<script src="/template/js/jquery.scrollUp.min.js"></script>
<script src="/template/js/price-range.js"></script>
<script src="/template/js/jquery.prettyPhoto.js"></script>
<script src="/template/js/main.js"></script>  
<script src="/template/js/jquery.auroramenu.js"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
    $(document).ready(function(){
        $(".add-to-cart").click(function () {
            var id = $(this).attr("data-id");
            $.post("/cart/addAjax/"+id, {}, function (data) {
                $("#cart-count").html(data);
            });
            return false;
        });
    });
</script>

</body>
</html>