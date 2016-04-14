<form action="<?= base_url() ?>administration/parser/add" method="post">
    <input type="text" name="name_pars" class="name_parser">
    <input type="submit" class="add_parser" value="ок">
</form>
<?
if (!empty($list_parser)) {
    foreach ($list_parser as $key => $item_parser): ?>
        <a href="<?= request_url() . "/" . $item_parser->id ?>"><?= $item_parser->name_parser?></a>
    <?endforeach;
} ?>
<?
if (!empty($list_source)) :?>
    <div class="list">
    <? foreach ($list_source as $key => $item_parser): ?>
        <div class="item-pars">
            <a href="/administration/parser/<?= $item_parser->tr_name ?>"
               data-id="<?= $item_parser->id ?>"><?= $item_parser->name_source ?></a>
            <input type="submit" class="start-parser">
        </div>
    <? endforeach; ?>
    </div>
<? endif; ?>
<script>
    $(document).ready(function () {
        $('.start-parser').click(function () {
            var id_source = $(this).siblings().attr('data-id');
            var Data = {};
            Data["id_source"] = id_source;
            $.ajax({
                type: "POST",
                url: "<?=base_url()?>ajax/source",
                data: Data,
                dataType: 'json',
                success: function (msg) {
                    msg.success.forEach(function (item, i, arr) {
                        console.log(item.id);
                        var id_pars ={};
                        id_pars['id_parser'] = item.id;
                        $.ajax({
                            type: "POST",
                            url: "<?=base_url()?>ajax/item_parser",
                            data: id_pars,
                            dataType: 'json',
                            success: function (msg) {
                                msg.success.forEach(function (item, i, arr) {
                                    console.log(i);
                                    console.log(item);
                                });
                            }
                        });

                    });
                }
            });
        })
    })
</script>