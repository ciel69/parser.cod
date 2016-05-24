<?php
if (!empty($newDefItem)) {
//    vdgu($newDefItem);
//    vdgu($arPropertyParser);
    ?>
    <div class="body_parser">
<?
    foreach ($newDefItem as $cell=>$item){
        
        formation_form($item);
    }
?>
        <div class="property_block">
            <?
            if(!empty($arPropertyParser)):
                foreach ($arPropertyParser as $property):?>
                    <div class="row_property">
                        <input class="name_property" type="text" value="<?=$property["name"]?>">
                        <input class="value_property" type="text" value="<?=$property["value"]?>">
                    </div>
                <? endforeach;
            endif;?>

        </div>
        <input type="button" class="add_row" value="add">
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

        $('.add_row').click(function () {
            $('.property_block').append('<div class="row_property"><input class="name_property" type="text" value=""><input class="value_property" type="text" value=""></div>');
        });

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
        
        $('.save_pars').click(function () {
            var Data = {parser: {}};
            var property = [];
            //$(this).attr('class')
            $('.body_parser').children('.inputs_parser').each(function(){
                var class_inputs = $(this).attr('class').replace(/(^|\s)inputs_parser(\s|$)/g, '');
                Data.parser[class_inputs] = $(this).val();
            });

            $('.property_block').children('.row_property').each(function(i){
                    property[i] = {
                        name_property:$(this).children('.name_property').val(),
                        value_property:$(this).children('.value_property').val()
                    };
            });
            Data.parser["property"] = property;
            console.log(Data);
            if(!!files){
                console.log(files);
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
                Data.parser['img_filter'] = $('img.img_filter').attr('src')||"";
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