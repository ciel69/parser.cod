<?php
if (!empty($newDefItem)) {
//    vdgu($newDefItem);
    ?>
    <div class="body_parser">
<?
    foreach ($newDefItem as $cell=>$item){
        
        formation_form($item);
    }
?>
    </div>
        <?
} else {
    $property = $this->parser_list->get_default_property();
    foreach ($property as $item) {
        formation_default_form($item);
    }
}
?>
<input type="submit" class="pars" value="Ok">
<input type="submit" class="save_pars" value="Save">
<script>window.FileAPI = { staticPath: '/public/FileAPI/dist/' };</script>
<script src="/public/FileAPI/dist/FileAPI.min.js"></script>
<script>
    $(document).ready(function () {
        var files;
        
        FileAPI.event.on(choose, 'change', function (evt){
            files = FileAPI.getFiles(evt); // Retrieve file list
            FileAPI.filterFiles(files, function (file, info/**Object*/){
                if( /^image/.test(file.type) ){
                    return  info.width >= 320 && info.height >= 240;
                }
                return  false;
            }, function (files/**Array*/, rejected/**Array*/){
                if( files.length ){
                    // Создаем предпросмотр 100x100
                    FileAPI.each(files, function (file){
                        FileAPI.Image(file).preview(200).get(function (err, img){
                            images.appendChild(img);
                        });
                    });

                    // Загружаем файлы
                }
            });
        });
        /*$('.pars').click(function () {
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
                url: "ajax/parser",
                data: Data,
                dataType: 'json',
                success: function (msg) {
                    console.log(msg);
                }
            });
        });*/
        $('.save_pars').click(function () {
            var Data = {parser: {}};
            //$(this).attr('class')
            $('.body_parser').children().each(function(){
                Data.parser[$(this).attr('class')] = $(this).val();
            });
            if(!!files){
                FileAPI.upload({
                    url: '/ajax/saveImage',
                    files: { images: files },
                    progress: function (evt){ /* ... */ },
                    complete: function (err, xhr){
                        console.log(xhr.responseText);
                        Data.parser['img_filter'] = xhr.responseText;
                        console.log(Data);
                        $.ajax({
                            type: "POST",
                            url: "<?=base_url()?>ajax/save_parser",
                            data: Data,
                            dataType: 'json',
                            success: function (msg) {
                                console.log(msg);
                            }
                        });
                    }
                })
            } else {
                $.ajax({
                    type: "POST",
                    url: "<?=base_url()?>ajax/save_parser",
                    data: Data,
                    dataType: 'json',
                    success: function (msg) {
                        console.log(msg);
                    }
                });
            }
        });
    });
</script>