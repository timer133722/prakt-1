<?php

 //Ключ защиты
 if(!defined('BEZ_KEY'))
 {
     header("HTTP/1.1 404 Not Found");
     exit(file_get_contents('./404.html'));
 }

 define('BEZ_DBSERVER','localhost');

 define('BEZ_DBUSER','root');

 define('BEZ_DBPASSWORD','');

 define('BEZ_DATABASE','Belousov');

 define('BEZ_DBPREFIX','bez_');

 define('BEZ_ERROR_CONNECT','Немогу соеденится с БД');

 define('BEZ_NO_DB_SELECT','Данная БД отсутствует на сервере');

 define('BEZ_HOST','http://'. $_SERVER['HTTP_HOST'] .'/');
 
 define('BEZ_MAIL_AUTOR','Регистрация на http://bezramok-tlt.ru <no-reply@bezramok-tlt.ru>');
 ?>