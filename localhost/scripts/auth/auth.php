<?php

 if(isset($_GET['exit']) == true){
 	session_destroy();

 	header('Location:'. BEZ_HOST .'?mode=auth');
 	exit;
 }

 if(isset($_POST['submit']))
 {
	//Проверки
	if(empty($_POST['email']))
		$err[] = 'Не введен Логин';
	
	if(empty($_POST['pass']))
		$err[] = 'Не введен Пароль';
	
	if(emailValid($_POST['email']) === false)
		$err[] = 'Не корректный E-mail';

	if(count($err) > 0)
		echo showErrorMessage($err);
	else
	{
		/*Создаем запрос на выборку из базы 
		данных для проверки подлиности пользователя*/
		$sql = 'SELECT * FROM `'. BEZ_DBPREFIX .'reg` AS `u`
				LEFT JOIN `'. BEZ_DBPREFIX .'role` AS `r` ON `u`.`role` = `r`.`id_role`
				WHERE `login` = :email
				AND `status` = 1';
		//Подготавливаем PDO выражение для SQL запроса
		$stmt = $db->prepare($sql);
		$stmt->bindValue(':email', $_POST['email'], PDO::PARAM_STR);
		$stmt->execute();

		//Получаем данные SQL запроса
		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		//Если логин совподает, проверяем пароль
		if(count($rows) > 0)
		{
			//Получаем данные из таблицы
			if(md5(md5($_POST['pass']).$rows[0]['salt']) == $rows[0]['pass'])
			{	
				//Переменные для работы с залогиненым пользователем!
				$_SESSION['user'] 	= true;
				$_SESSION['login'] 	= $_POST['email'];
				$_SESSION['role'] 	= $rows[0]['role'];
				$_SESSION['name'] 	= $rows[0]['name'];
				
				//Сбрасываем параметры
				header('Location:'. BEZ_HOST .'?mode=auth');
				exit;
			}
			else
				echo showErrorMessage('Неверный пароль!');
		}else{
			echo showErrorMessage('Логин <b>'. $_POST['email'] .'</b> не найден!');
		}
	}
 }
 
?>