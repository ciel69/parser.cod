<html>
<title>Пример - получение доминирующих цветов в изображении</title>
<meta name="keywords" content="используемые,цвета,изображении,часто,наиболее,Color,getimagecolor,Получить,Image"/>
<meta name="description" content="Получить наиболее часто используемые цвета в изображении "/>
<style>
    div.color {
        margin-bottom: 1px;
        border: 1px solid #eee;
    }
</style>
<body>

<form name="mainform" id="mainform" action="" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Выберите фото(JPG):</td>
            <td><input type="file" name="image"/></td>
        </tr>
        <tr>
            <td>Количество цветов:</td>
            <td><input type="text" name="count" value="<?= isset($_POST['count']) ? $_POST['count'] : 10; ?>"/></td>
        </tr>
        <tr>
            <td>Шаг(px):</td>
            <td><input type="text" name="step" value="<?= isset($_POST['step']) ? $_POST['step'] : 5; ?>"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" name="colorator" value="Отправить"/></td>
        </tr>
    </table>
</form>
<br/>
<?php
/**********************************************************************************************************************************/
/**********************************************************************************************************************************/
define('SITEPATH', '../');
if (isset($_POST['colorator'])) {
    require_once "getImageColor.php";// подключаем файл со скриптом
    $img = new GeneratorImageColorPalette();
    if (!empty($_FILES['image']) and $_FILES['image']['error'] == 0) {
        $f_name = trim($_FILES['image']['name']);
        $f_tmp = $_FILES['image']['tmp_name'];
        move_uploaded_file($f_tmp, './img/' . $f_name);
        $fi = pathinfo('./img/' . $f_name);
        $iobj = strtolower($fi["extension"]);
        @rename('./img/' . $f_name, './img/' . md5($f_name) . '.' . $iobj);
        $f_name = md5($f_name) . '.' . $iobj;
        if (in_array($iobj, array('jpg')) !== false) {
            $colors = $img->getImageColor('./img/' . $f_name, isset($_POST['count']) ? $_POST['count'] : 10, isset($_POST['step']) ? $_POST['step'] : 5);
            print_r($colors);
            echo '<br/><br/>';
            $max = 1;
            foreach ($colors as $color => $count) {
                $max = max($count, $max);
            }
            $width = 500;
            $size = @getimagesize('./img/' . $f_name);
            echo '<table>
				<tr>
					<td>
						<img src="./img/' . $f_name . '" width="' . ($size[0] > $width ? $width : $size[0]) . '"/>
					</td>
					<td valign="top">';
            echo '<div style="border:1px solid #ddd; width:' . $width . 'px; padding:5px;">';
            foreach ($colors as $color => $count) {
                $wd = round(($count / $max) * $width);
                echo '<div class="color" style="background-color:#' . $color . ';width:' . $wd . 'px">#' . $color . '</div>' . "\n";
            }
            echo '</div>';
            echo '</td>
			</tr>
			</table>';
        } else echo 'Данный формат не поддерживается';
    } else echo 'Ошибка при загрузке файла';
}
?>
</body>
</html>