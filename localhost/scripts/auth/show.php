<?php
 if($user === false){
 	echo '<h3>Привет Гость, доступ закрыт авторизируйтесь!</h3>'."\n";
 }
 
 //Если пользователь авторизовался
 if($user === true) {
	echo '<h4>Добро пожаловать <span style="color:red;">'. $_SESSION['login'] .'</span> - вы вошли как <span style="color:red;">'.$_SESSION['name'].'</span> <a href="'.BEZ_HOST.'?mode=auth&exit=true">ВЫЙТИ</a></h4>';
	
	//Запрос на выборку контента согласно роли
	$sql = 'SELECT * FROM `'. BEZ_DBPREFIX.'content`
			WHERE `role` LIKE "%'. $_SESSION['role'] .'%"';
	$stmt = $db->prepare($sql);
	
	if($stmt->execute()){
		
		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		foreach($rows as $val){
			echo '# - <strong>'. $val['id'] .'</strong><br/>';
			echo $val['content'] .'<br/><br/>';
		}
	}
 }
 ?>
	