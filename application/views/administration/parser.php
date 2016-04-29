<?php
if (!empty($newDefItem)) {
//    vdgu($newDefItem);
    foreach ($newDefItem as $cell=>$item){
        
        formation_form($item);
    }
} else {
    $property = $this->parser_list->get_default_property();
    foreach ($property as $item) {
        formation_default_form($item);
    }
}
?>
<input type="submit" class="pars" value="Ok">
<input type="submit" class="save_pars" value="Save">
<script>
    $(document).ready(function () {
        $('.pars').click(function () {
            var Data = {};
            Data['url'] = $('.url').val();
            Data['class_item'] = $('.class_item').val();
            Data['next_link'] = $('.name_source').val();
            Data['next_link'] = $('.next_link').val();
            Data['name_item'] = $('.name_item').val();
            Data['code_item'] = $('.code_item').val();
            Data['exceptions'] = $('.exceptions').val();
            Data['link_reviews'] = $('.link_reviews').val();
            Data['class_review'] = $('.class_review').val();
            Data['class_page_rev'] = $('.class_page_rev').val();
            $.ajax({
                type: "POST",
                url: "<?=base_url()?>ajax/parser",
                data: Data,
                dataType: 'json',
                success: function (msg) {
                    console.log(msg);
                }
            });
        });
        $('.save_pars').click(function () {
            var Data = {parser: {}};
            Data.parser['id_pars'] = $('.id_pars').val();
            Data.parser['name_source'] = $('.name_source').val();
            Data.parser['name_parser'] = $('.name_parser').val();
            Data.parser['url'] = $('.url').val();
            Data.parser['class_item'] = $('.class_item').val();
            Data.parser['next_link'] = $('.next_link').val();
            Data.parser['name_item'] = $('.name_item').val();
            Data.parser['code_item'] = $('.code_item').val();
            Data.parser['exceptions'] = $('.exceptions').val();
            Data.parser['link_reviews'] = $('.link_reviews').val();
            Data.parser['class_review'] = $('.class_review').val();
            Data.parser['class_page_rev'] = $('.class_page_rev').val();
            $.ajax({
                type: "POST",
                url: "<?=base_url()?>ajax/save_parser",
                data: Data,
                dataType: 'json',
                success: function (msg) {
                    console.log(msg);
                }
            });
        });
    });
</script>