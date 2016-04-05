<form action="<?=base_url()?>administration/parser/add" method="post">
<input type="text" name="name_pars" class="name_parser">
<input type="submit" class="add_parser" value="ок">
</form>
<?foreach ($list_parser as $key=>$item_parser):?>
    <a href="/administration/parser/<?=$item_parser->id?>"><?=$item_parser->name?></a>
<?endforeach;?>
<script>
    /*$(document).ready(function () {
        $('.add_parser').click()
    })*/
</script>