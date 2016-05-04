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

<form name="mainform" id="mainform" action="/ajax/color" method="post" enctype="multipart/form-data">
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
<script>
    
</script>
<?php
/**********************************************************************************************************************************/
/**********************************************************************************************************************************/

?>
</body>
</html>