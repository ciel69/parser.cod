<input type="hidden" class="id_pars" value="">
<input type="text" class="name_source" value="" placeholder="Название источника"><br>
<input type="text" class="name_parser" value="" placeholder="Название категории"><br>
<textarea class="site_url" placeholder="Ссылка на сайт"></textarea><br>
<input type="text" class="item" value="" placeholder="Класс элемента"><br>
<input type="text" class="next_link" value="" placeholder="класс paginator'a"><br>
<input type="text" class="name_item" value="" placeholder="название товара"><br>
<input type="text" class="code_item" value="" placeholder="код товара"><br>
<textarea class="exceptions" placeholder="исключения"></textarea><br>
<textarea class="link_reviews" placeholder="шаблон ссылки на отзывы"></textarea><br>
<input type="text" class="class_review" value="" placeholder="класс текста отзыва"><br>
<input type="text" class="class_page_rev" value="" placeholder="след страница отзывов"><br>
<input type="submit" class="pars" value="Ok">
<input type="submit" class="save_pars" value="Save">
<script>
    $(document).ready(function () {
        $('.pars').click(function () {
            var Data = {};
            Data['url'] = $('.site_url').val();
            Data['item'] = $('.item').val();
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
            var Data = {parser:{}};
            Data.parser['id_pars'] = $('.id_pars').val();
            Data.parser['name_source'] = $('.name_source').val();
            Data.parser['name_parser'] = $('.name_parser').val();
            Data.parser['url'] = $('.site_url').val();
            Data.parser['item'] = $('.item').val();
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

