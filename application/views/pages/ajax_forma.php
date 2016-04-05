<input type="hidden" name="user_id" value="">
<input type="hidden" name="purchase_id" value="">
<div id="dc>">
    <input type="text" name="comment" value="комментарий к заказу"><br>
    <input type="button" name="subscribe" value="Заказать" onclick="ajax_order()">
</div>
<script>
    function ajax_order() {
        var comment = $("input[name=comment]").val();
        $("#dc").html("<div class='cell_prep_order'><img src='<?=base_url()?>include/images/ajax.gif'></div>");
        $.post("<?=base_url()?>ajax/index",
            {
                comment: comment
            },
            function (data) {
                $("#dc").html(data);
            }
        );
    }
</script>