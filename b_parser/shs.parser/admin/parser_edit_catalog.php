<?
//********************
//Rubric
//********************   
global $shs_IBLOCK_ID;
$tabControl->BeginNextTab();
$arEncoding['reference'] = array('utf-8', 'windows-1251');
$arEncoding['reference_id'] = array('utf-8', 'windows-1251');
$arType['reference'] = array('html', 'text');
$arType['reference_id'] = array('html', 'text');
$arMode['reference'] = array('debug', 'work');
$arMode['reference_id'] = array('debug', 'work');
if ($shs_DEMO != 1) {
    unset($arMode['reference'][1]);
    unset($arMode['reference_id'][1]);
}


$arTypeParser['reference'] = array('rss', 'page', 'catalog');
$arTypeParser['reference_id'] = array('rss', 'page', 'catalog');

$arUpdate['reference'] = array(GetMessage("parser_update_N"), GetMessage("parser_update_Y"), GetMessage("parser_update_empty"));
$arUpdate['reference_id'] = array('N', 'Y', 'empty');

//$arPriceTerms['reference'] = array(GetMessage("parser_price_terms_no"), GetMessage("parser_price_terms_up"), GetMessage("parser_price_terms_down"));
//$arPriceTerms['reference_id'] = array('', 'up', 'down');

$arPriceTerms['reference'] = array(GetMessage("parser_price_terms_no"), GetMessage("parser_price_terms_delta"));
$arPriceTerms['reference_id'] = array('', 'delta');

$arPriceUpDown['reference'] = array(GetMessage("parser_price_updown_no"), GetMessage("parser_price_updown_up"), GetMessage("parser_price_updown_down"));
$arPriceUpDown['reference_id'] = array('', 'up', 'down');

$arPriceValue['reference'] = array(GetMessage("parser_price_percent"), GetMessage("parser_price_abs_value"));
$arPriceValue['reference_id'] = array('percent', 'value');

$hideCatalog = false;
if ($isCatalog && CModule::IncludeModule('catalog') && CModule::IncludeModule('currency')/* && (($shs_IBLOCK_ID && CCatalog::GetList(Array("name" => "asc"), Array("ACTIVE"=>"Y", "ID"=>$shs_IBLOCK_ID))->Fetch()) || !$shs_IBLOCK_ID) */) {
    $dbPriceType = CCatalogGroup::GetList(
                    array("SORT" => "ASC"), array()
    );

    while ($arPriceTypes = $dbPriceType->Fetch()) {
        $arPriceType["reference"][] = $arPriceTypes["NAME_LANG"];
        $arPriceType["reference_id"][] = $arPriceTypes["ID"];
    }
    $arConvertCurrency["reference"][] = GetMessage("parser_convert_no");
    $arConvertCurrency["reference_id"][] = "";
    $lcur = CCurrency::GetList(($by = "name"), ($order1 = "asc"), LANGUAGE_ID);
    while ($lcur_res = $lcur->Fetch()) {
        $arCurrency["reference"][] = $lcur_res["FULL_NAME"];
        $arCurrency["reference_id"][] = $lcur_res["CURRENCY"];
        $arConvertCurrency["reference"][] = $lcur_res["FULL_NAME"];
        $arConvertCurrency["reference_id"][] = $lcur_res["CURRENCY"];
    }
    $info = CModule::CreateModuleObject('catalog');

    if (!CheckVersion("14.0.0", $info->MODULE_VERSION)) {
        $dbResultList = CCatalogMeasure::getList(array(), array(), false, false, array("ID", "CODE", "MEASURE_TITLE", "SYMBOL_INTL", "IS_DEFAULT"));
        while ($arMeasure = $dbResultList->Fetch()) {
            $arAllMeasure["reference_id"][] = $arMeasure["ID"];
            $arAllMeasure["reference"][] = $arMeasure["MEASURE_TITLE"];
        }
    }

    $arVATRef = CatalogGetVATArray(array(), true);
} else
    $hideCatalog = true;





$disabled = false;
unset($arrDateActive['REFERENCE'][2]);
unset($arrDateActive['REFERENCE_ID'][2]);
$arrDate = ParseDateTime($shs_START_LAST_TIME_X, "YYYY.MM.DD HH:MI:SS");
if ($shs_TYPE)
    $disabled = 'disabled=""';
?>
<tr>
    <td><? echo GetMessage("parser_type") ?></td>
    <td><?= SelectBoxFromArray('TYPE', $arTypeParser, $shs_TYPE ? $shs_TYPE : $_GET["type"], "", $disabled); ?>
<? if ($disabled): ?><input type="hidden" name="TYPE" value="<?= $shs_TYPE ?>" /><? endif; ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_mode") ?></td>
    <td><?= SelectBoxFromArray('SETTINGS[catalog][mode]', $arMode, $shs_SETTINGS["catalog"]["mode"] ? $shs_SETTINGS["catalog"]["mode"] : "debug", "", ""); ?></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_mode_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_act") ?></td>
    <td width="60%"><input type="checkbox" name="ACTIVE" value="Y"<? if ($shs_ACTIVE == "Y" || !$ID) echo " checked" ?>>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_sort") ?></td>
    <td><input type="text" name="SORT" value="<? echo!$ID ? "100" : $shs_SORT; ?>" size="4"></td>
</tr>
<tr>
    <td><span class="required">*</span><? echo GetMessage("parser_name") ?></td>
    <td><input type="text" name="NAME" value="<? echo $shs_NAME; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td><span class="required">*</span><? echo GetMessage("parser_rss_catalog") ?></td>
    <td><input type="text" name="RSS" value="<? echo $shs_RSS; ?>" size="80" maxlength="500"></td>
</tr>
<tr>
    <td style="vertical-align:top"><? echo GetMessage("parser_url_dop") ?></td>
    <td>
        <textarea name="SETTINGS[catalog][url_dop]" cols="65" rows="5"><?= $shs_SETTINGS["catalog"]["url_dop"] ?></textarea>
    </td>
</tr>  
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_url_dop_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><span class="required">*</span><? echo GetMessage("parser_iblock_id_catalog") ?></td>
    <td><?= SelectBoxFromArray('IBLOCK_ID', $arIBlock, $shs_IBLOCK_ID, GetMessage("parser_iblock_id"), "id='iblock' style='width:262px' "); ?>
        <? /* ?><?if($disabled):?><input type="hidden" name="IBLOCK_ID" value="<?=$shs_IBLOCK_ID?>" /><?endif; */ ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_section_id") ?></td>
    <td><?= SelectBoxFromArray('SECTION_ID', $arSection, $shs_SECTION_ID, GetMessage("parser_section_id"), "id='section' style='width:262px'"); ?></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_encoding") ?></td>
    <td><?= SelectBoxFromArray('ENCODING', $arEncoding, $shs_ENCODING); ?></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_encoding_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_step") ?></td>
    <td><input type="text" name="SETTINGS[catalog][step]" value="<? echo $shs_SETTINGS["catalog"]["step"] ? $shs_SETTINGS["catalog"]["step"] : 30; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_start_last_time") ?></td>
    <td><input type="text" disabled name="START_LAST_TIME_X" value="<? echo $arrDate[DD] . '.' . $arrDate[MM] . '.' . $arrDate[YYYY] . ' ' . $arrDate[HH] . ':' . $arrDate[MI] . ':' . $arrDate[SS]; ?>" size="20"></td>
</tr>
<?
//********************
//Auto params
//********************
$tabControl->BeginNextTab();
?>
<tr>
    <td class="field-name" width="40%"><? echo GetMessage("parser_pagenavigation_selector") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][pagenavigation_selector]" value="<? echo $shs_SETTINGS["catalog"]["pagenavigation_selector"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_pagenavigation_selector_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_pagenavigation_one") ?></td>
    <td><input type="text" name="SETTINGS[catalog][pagenavigation_one]" value="<? echo $shs_SETTINGS["catalog"]["pagenavigation_one"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_pagenavigation_one_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_pagenavigation_delete") ?></td>
    <td><input type="text" name="SETTINGS[catalog][pagenavigation_delete]" value="<? echo $shs_SETTINGS["catalog"]["pagenavigation_delete"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_pagenavigation_begin") ?></td>
    <td><input type="text" name="SETTINGS[catalog][pagenavigation_begin]" value="<? echo $shs_SETTINGS["catalog"]["pagenavigation_begin"]; ?>" size="5" maxlength="5"> <? echo GetMessage("parser_pagenavigation_end") ?> <input type="text" name="SETTINGS[catalog][pagenavigation_end]" value="<? echo $shs_SETTINGS["catalog"]["pagenavigation_end"]; ?>" size="5" maxlength="5"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_pagenavigation_begin_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
        <?
//********************
//Attachments
//********************
        $tabControl->BeginNextTab();
        ?>  <tr>
    <td class="field-name" width="40%"><? echo GetMessage("parser_selector_preview_catalog") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][selector]" value="<? echo $shs_SETTINGS["catalog"]["selector"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_selector_catalog_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_href_catalog") ?></td>
    <td><input type="text" name="SETTINGS[catalog][href]" value="<? echo $shs_SETTINGS["catalog"]["href"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_href_descr_catalog") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_name_catalog") ?></td>
    <td><input type="text" name="SETTINGS[catalog][name]" value="<? echo $shs_SETTINGS["catalog"]["name"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_name_descr_page") ?>
<?= EndNote(); ?>
    </td>
</tr>

<tr>
    <td><? echo GetMessage("parser_preview_price") ?></td>
    <td><input type="text" name="SETTINGS[catalog][preview_price]" value="<? echo $shs_SETTINGS["catalog"]["preview_price"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_price_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_preview_text_selector") ?></td>
    <td><input type="text" name="SETTINGS[catalog][preview_text_selector]" value="<? echo $shs_SETTINGS["catalog"]["preview_text_selector"]; ?>" size="40" maxlength="250"></td>
</tr>

<tr>
    <td><? echo GetMessage("parser_preview_text_type_catalog") ?></td>
    <td><?= SelectBoxFromArray('PREVIEW_TEXT_TYPE', $arType, $shs_PREVIEW_TEXT_TYPE, "", ""); ?></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_preview_delete_tag_catalog") ?></td>
    <td><input class="bool-delete" type="checkbox" name="BOOL_PREVIEW_DELETE_TAG" value="Y"<? if ($shs_BOOL_PREVIEW_DELETE_TAG == "Y") echo " checked" ?>> <? echo GetMessage("parser_bool_preview_delete_tag") ?><input <? if ($shs_BOOL_PREVIEW_DELETE_TAG != "Y"): ?>disabled <? endif ?> type="text" name="PREVIEW_DELETE_TAG" value="<? echo $shs_PREVIEW_DELETE_TAG; ?>" size="40" maxlength="300"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_delete_tag_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_preview_delete_element") ?></td>
    <td width="60%"><input size="40" maxlength="300" type="text" name="PREVIEW_DELETE_ELEMENT" value="<?= $shs_PREVIEW_DELETE_ELEMENT ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_delete_element_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_preview_delete_attribute") ?></td>
    <td width="60%"><input size="40" maxlength="300" type="text" name="PREVIEW_DELETE_ATTRIBUTE" value="<?= $shs_PREVIEW_DELETE_ATTRIBUTE ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_delete_attribute_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_preview_first_img_catalog") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][preview_picture]" value="<? echo isset($shs_SETTINGS["catalog"]["preview_picture"]) ? $shs_SETTINGS["catalog"]["preview_picture"] : "img:eq(0)[src]"; ?>" size="40" maxlength="255" /></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_first_img_descr_catalog") ?>
<?= EndNote(); ?>
    </td>
</tr>
        <? /* <tr>
          <td width="40%"><?echo GetMessage("parser_preview_save_img")?></td>
          <td width="60%"><input type="checkbox" name="PREVIEW_SAVE_IMG" value="Y"<?if($shs_PREVIEW_SAVE_IMG == "Y") echo " checked"?>></td>
          </tr>
          <tr>
          <td></td>
          <td>
          <?=BeginNote();?>
          <?echo GetMessage("parser_preview_save_img_descr")?>
          <?=EndNote();?>
          </td>
          </tr> */ ?>


<?
//********************
//Attachments
//********************
$tabControl->BeginNextTab();
?>
<tr>
    <td class="field-name" width="40%"><? echo GetMessage("parser_selector_detail_catalog") ?></td>
    <td width="60%"><input type="text" name="SELECTOR" value="<? echo $shs_SELECTOR; ?>" size="40" maxlength="250"></td>
</tr>

<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_selector_detail_catalog_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_detail_name") ?></td>
    <td><input type="text" name="SETTINGS[catalog][detail_name]" value="<? echo $shs_SETTINGS["catalog"]["detail_name"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_detail_name_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td><? echo GetMessage("parser_preview_price") ?></td>
    <td><input type="text" name="SETTINGS[catalog][detail_price]" value="<? echo $shs_SETTINGS["catalog"]["detail_price"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_detail_text_selector") ?></td>
    <td><input type="text" name="SETTINGS[catalog][detail_text_selector]" value="<? echo $shs_SETTINGS["catalog"]["detail_text_selector"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_detail_text_type_catalog") ?></td>
    <td><?= SelectBoxFromArray('DETAIL_TEXT_TYPE', $arType, $shs_DETAIL_TEXT_TYPE, "", ""); ?></td>
</tr>
<tr>
    <td><? echo GetMessage("parser_detail_delete_tag") ?></td>
    <td><input class="bool-delete" type="checkbox" name="BOOL_DETAIL_DELETE_TAG" value="Y"<? if ($shs_BOOL_DETAIL_DELETE_TAG == "Y") echo " checked" ?>> <? echo GetMessage("parser_bool_detail_delete_tag") ?><input <? if ($shs_BOOL_DETAIL_DELETE_TAG != "Y"): ?>disabled <? endif ?> type="text" name="DETAIL_DELETE_TAG" value="<? echo $shs_DETAIL_DELETE_TAG; ?>" size="40" maxlength="300"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_preview_delete_tag_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_detail_delete_element") ?></td>
    <td width="60%"><input size="40" maxlength="300" type="text" name="DETAIL_DELETE_ELEMENT" value="<?= $shs_DETAIL_DELETE_ELEMENT ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_detail_delete_element_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_detail_delete_attribute") ?></td>
    <td width="60%"><input size="40" maxlength="300" type="text" name="DETAIL_DELETE_ATTRIBUTE" value="<?= $shs_DETAIL_DELETE_ATTRIBUTE ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_detail_delete_attribute_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_detail_first_img_catalog") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][detail_picture]" value="<? echo isset($shs_SETTINGS["catalog"]["detail_picture"]) ? $shs_SETTINGS["catalog"]["detail_picture"] : "img:eq(0)[src]"; ?>" size="40" maxlength="255" /></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_detail_first_img_descr_catalog") ?>
<?= EndNote(); ?>
    </td>
</tr>
        <? /* ?><tr>
          <td width="40%"><?echo GetMessage("parser_detail_save_img")?></td>
          <td width="60%"><input type="checkbox" name="DETAIL_SAVE_IMG" value="Y"<?if($shs_DETAIL_SAVE_IMG == "Y") echo " checked"?>></td>
          </tr>
          <tr>
          <td></td>
          <td>
          <?=BeginNote();?>
          <?echo GetMessage("parser_detail_save_img_descr")?>
          <?=EndNote();?>
          </td>
          </tr><? */ ?>

<?
$tabControl->BeginNextTab();
?>
<tr class="heading">
    <td colspan="2"><? echo GetMessage("parser_more_image") ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_more_image_prop") ?></td>
    <td width="60%"><?= SelectBoxFromArray('SETTINGS[catalog][more_image_props]', $arrPropFile, $shs_SETTINGS["catalog"]["more_image_props"], GetMessage("parser_prop_id"), "class='image_props'"); ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_selector_more_image") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][more_image]" value="<? echo $shs_SETTINGS["catalog"]["more_image"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td></td>
    <td>
<?= BeginNote(); ?>
<? echo GetMessage("parser_selector_more_image_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr class="heading" id="header_selector_prop">
    <td colspan="2"><? echo GetMessage("parser_selector_props") ?></td>
</tr>
<tr>
    <td class="field-name" width="40%"><? echo GetMessage("parser_catalog_delete_symb") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][catalog_delete_selector_props_symb]" value="<? echo $shs_SETTINGS["catalog"]["catalog_delete_selector_props_symb"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr>
    <td class="field-name" width="40%"></td>
    <td width="60%">
<?= BeginNote(); ?>
<? echo GetMessage("parser_delete_symb_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
        <?
        //printr($arrPropDop);
        $arMas1 = explode(",", $shs_SETTINGS["catalog"]["delete_selector_prop"]);
        foreach ($arrPropDop['REFERENCE_ID'] as $i => $val):
            $bool = false;
            if (in_array($val, $arMas1))
                $bool = true;
            ?>
    <tr <? if ($bool): ?>style="display:none"<? endif; ?>>
        <td width="40%"><?= $arrPropDop['REFERENCE'][$i] ?>&nbsp;[<?= $val ?>]:</td>
        <td width="60%"><input type="text" size="40" data-code="<?= $val ?>" name="SETTINGS[catalog][selector_prop][<?= $val ?>]" value="<?= $shs_SETTINGS["catalog"]["selector_prop"][$val] ?>">&nbsp;
    <?
    if ($arrPropDop['REFERENCE_TYPE'][$val] == "L"):
        //printr($arrPropDop["LIST_VALUES"][$val]);
        ?>
                <?= SelectBoxFromArray('SETTINGS[catalog][default_prop][' . $val . ']', $arrPropDop["LIST_VALUES"][$val], $shs_SETTINGS["catalog"]["default_prop"][$val], "", ""); ?>
            <? else: ?>
                <input type="text" <? if (!$shs_SETTINGS["catalog"]["default_prop"][$val]): ?>placeholder="<?= GetMessage("parser_prop_default") ?>"<? endif; ?> name="SETTINGS[catalog][default_prop][<?= $val ?>]" value="<?= $shs_SETTINGS["catalog"]["default_prop"][$val] ?>" />
            <? endif ?>
            <a class="prop_delete" href="#">Delete</a></td>
    </tr>
        <? endforeach ?>
<tr style="display:none">
    <td colspan="2"><input type="hidden" id="delete_selector_prop" name="SETTINGS[catalog][delete_selector_prop]" value="<?= $shs_SETTINGS["catalog"]["delete_selector_prop"] ?>" /></td>
</tr>
<tr class="heading" id="header_find_prop">
    <td colspan="2"><? echo GetMessage("parser_find_props") ?></td>
</tr>
<tr class="tr_find_prop">
    <td class="field-name" width="40%"><? echo GetMessage("parser_selector_find_props") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][selector_find_props]" value="<? echo $shs_SETTINGS["catalog"]["selector_find_props"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr class="tr_find_prop">
    <td class="field-name" width="40%"></td>
    <td width="60%">
<?= BeginNote(); ?>
<? echo GetMessage("parser_selector_find_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
<tr class="tr_find_prop">
    <td class="field-name" width="40%"><? echo GetMessage("parser_catalog_delete_symb") ?></td>
    <td width="60%"><input type="text" name="SETTINGS[catalog][catalog_delete_selector_find_props_symb]" value="<? echo $shs_SETTINGS["catalog"]["catalog_delete_selector_find_props_symb"]; ?>" size="40" maxlength="250"></td>
</tr>
<tr class="tr_find_prop">
    <td class="field-name" width="40%"></td>
    <td width="60%">
<?= BeginNote(); ?>
<? echo GetMessage("parser_delete_symb_descr") ?>
<?= EndNote(); ?>
    </td>
</tr>
        <?
        $arMas2 = explode(",", $shs_SETTINGS["catalog"]["delete_find_prop"]);
        foreach ($arrPropDop['REFERENCE_ID'] as $i => $val):
            $bool = false;
            if (in_array($val, $arMas2))
                $bool = true;
            ?>
    <tr <? if ($bool): ?>style="display:none"<? endif; ?>>
        <td width="40%"><?= $arrPropDop['REFERENCE'][$i] ?>&nbsp;[<?= $val ?>]:</td>
        <td width="60%"><input type="text" size="40" data-code="<?= $val ?>" name="SETTINGS[catalog][find_prop][<?= $val ?>]" value="<?= $shs_SETTINGS["catalog"]["find_prop"][$val] ?>">&nbsp;<a class="find_delete" href="#">Delete</a></td>
    </tr>
<? endforeach ?>
<tr style="display:none">
    <td colspan="2"><input type="hidden" id="delete_find_prop" name="SETTINGS[catalog][delete_find_prop]" value="<?= $shs_SETTINGS["catalog"]["delete_find_prop"] ?>" /></td>
</tr>

<?
if (!$hideCatalog):
    $tabControl->BeginNextTab();
    ?>
    <? if ($isOfferCatalog): ?>
        <tr>
            <td><? echo GetMessage("parser_cat_price_offer") ?></td>
            <td><input class="bool-delete" type="checkbox" name="SETTINGS[catalog][cat_vat_price_offer]" value="Y"<? if ($shs_SETTINGS["catalog"]["cat_vat_price_offer"] == "Y") echo " checked" ?> /></td>
        </tr>
    <? endif; ?>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_price_type") ?></td>
        <td width="60%"><?= SelectBoxFromArray('SETTINGS[catalog][price_type]', $arPriceType, $shs_SETTINGS["catalog"]["price_type"] ? $shs_SETTINGS["catalog"]["price_type"] : 1, "", ""); ?></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_cat_vat_id") ?></td>
        <td width="60%"><?= SelectBoxFromArray('SETTINGS[catalog][cat_vat_id]', $arVATRef, $shs_SETTINGS["catalog"]["cat_vat_id"], "", ""); ?></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_cat_vat_included") ?></td>
        <td><input class="bool-delete" type="checkbox" name="SETTINGS[catalog][cat_vat_included]" value="Y"<? if ($shs_SETTINGS["catalog"]["cat_vat_included"] == "Y") echo " checked" ?> /></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_currency") ?></td>
        <td><?= SelectBoxFromArray('SETTINGS[catalog][currency]', $arCurrency, $shs_SETTINGS["catalog"]["currency"] ? $shs_SETTINGS["catalog"]["currency"] : "RUB", "", ""); ?></td>
    </tr>
    <? if (isset($arAllMeasure)): ?>
        <tr>
            <td><? echo GetMessage("parser_measure") ?></td>
            <td><?= SelectBoxFromArray('SETTINGS[catalog][measure]', $arAllMeasure, $shs_SETTINGS["catalog"]["measure"] ? $shs_SETTINGS["catalog"]["measure"] : 5, "", ""); ?></td>
        </tr>
        <tr>
            <td><? echo GetMessage("parser_catalog_koef") ?></td>
            <td><input type="text" name="SETTINGS[catalog][koef]" value="<? echo $shs_SETTINGS["catalog"]["koef"] ? $shs_SETTINGS["catalog"]["koef"] : 1; ?>" size="40" maxlength="250"></td>
        </tr>

    <? endif; ?>
    <tr class="heading">
        <td colspan="2"><? echo GetMessage("parser_work_price") ?></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_convert_currency") ?></td>
        <td><?= SelectBoxFromArray('SETTINGS[catalog][convert_currency]', $arConvertCurrency, $shs_SETTINGS["catalog"]["convert_currency"], "", ""); ?></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_price_format") ?></td>
        <td><? echo GetMessage("parser_price_format1") ?><input type="text" name="SETTINGS[catalog][price_format1]" value="<? echo $shs_SETTINGS["catalog"]["price_format1"] ?>" size="1" maxlength="250"><? echo GetMessage("parser_price_format2") ?><input type="text" name="SETTINGS[catalog][price_format2]" value="<? echo $shs_SETTINGS["catalog"]["price_format2"] ?>" size="1" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"></td>
        <td width="60%">
    <?= BeginNote(); ?>
    <? echo GetMessage("parser_price_format_descr") ?>
    <?= EndNote(); ?>
        </td>
    </tr>
            <?
            $count = count($shs_SETTINGS["catalog"]["price_updown"]) - 1;
            if (is_set($shs_SETTINGS["catalog"]["price_updown"]) && is_array($shs_SETTINGS["catalog"]["price_updown"]) && count($shs_SETTINGS["catalog"]["price_updown"]) > 0) {
                foreach ($shs_SETTINGS["catalog"]["price_updown"] as $i => $val):
                    if ($count == $i)
                        $class = "tr_add";
                    else
                        $class = "";
                    ?>
            <tr class="heading <?= $class ?>" data-num="<?= ($i + 1) ?>">
                <td colspan="2"><? echo GetMessage("parser_work_price_num") ?> <span><?= ($i + 1) ?></span> <? if ($count == $i): ?><a href="#" style="font-size:12px;" class="add_usl"><? echo GetMessage("parser_price_num_add") ?></a><? endif; ?>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style="font-size:12px;<? if ($i == 0): ?>display:none<? endif; ?>" class="del_usl"><? echo GetMessage("parser_price_num_del") ?></a></td>
            </tr>
            <tr class="<?= $class ?>">
                <td><? echo GetMessage("parser_price_updown") ?></td>
                <td><?= SelectBoxFromArray('SETTINGS[catalog][price_updown][]', $arPriceUpDown, $shs_SETTINGS["catalog"]["price_updown"][$i], "", ""); ?></td>
            </tr>
            <tr class="<?= $class ?>">
                <td><? echo GetMessage("parser_price_terms") ?></td>
                <td><?= SelectBoxFromArray('SETTINGS[catalog][price_terms][]', $arPriceTerms, $shs_SETTINGS["catalog"]["price_terms"][$i], "", ""); ?> <? echo GetMessage("parser_price_from") ?> <input type="text" name="SETTINGS[catalog][price_terms_value][]" value="<? echo $shs_SETTINGS["catalog"]["price_terms_value"][$i]; ?>" size="10" maxlength="250"> <? echo GetMessage("parser_price_to") ?> <input type="text" name="SETTINGS[catalog][price_terms_value_to][]" value="<? echo $shs_SETTINGS["catalog"]["price_terms_value_to"][$i]; ?>" size="10" maxlength="250"></td>
            </tr>
            <tr class="<?= $class ?>">
                <td><? echo GetMessage("parser_price_type_value") ?></td>
                <td><?= SelectBoxFromArray('SETTINGS[catalog][price_type_value][]', $arPriceValue, $shs_SETTINGS["catalog"]["price_type_value"][$i], "", ""); ?></td>
            </tr>
            <tr class="<?= $class ?> <? if ($class): ?>tr_last<? endif; ?>">
                <td><? echo GetMessage("parser_price_value") ?></td>
                <td><input type="text" name="SETTINGS[catalog][price_value][]" value="<? echo $shs_SETTINGS["catalog"]["price_value"][$i]; ?>" size="10" maxlength="250"></td>
            </tr>
        <?
        endforeach;
    }else {
        ?>
        <tr class="heading tr_add" data-num="1">
            <td colspan="2"><? echo GetMessage("parser_work_price_num") ?> <span></span> <a href="#" style="font-size:12px;" class="add_usl"><? echo GetMessage("parser_price_num_add") ?></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style="font-size:12px;display:none" class="del_usl"><? echo GetMessage("parser_price_num_del") ?></a></td>
        </tr>
        <tr class="tr_add">
            <td><? echo GetMessage("parser_price_updown") ?></td>
            <td><?= SelectBoxFromArray('SETTINGS[catalog][price_updown][]', $arPriceUpDown, $shs_SETTINGS["catalog"]["price_updown"], "", ""); ?></td>
        </tr>
        <tr class="tr_add">
            <td><? echo GetMessage("parser_price_terms") ?></td>
            <td><?= SelectBoxFromArray('SETTINGS[catalog][price_terms][]', $arPriceTerms, $shs_SETTINGS["catalog"]["price_terms"], "", ""); ?> <? echo GetMessage("parser_price_from") ?> <input type="text" name="SETTINGS[catalog][price_terms_value][]" value="<? echo $shs_SETTINGS["catalog"]["price_terms_value"]; ?>" size="10" maxlength="250"> <? echo GetMessage("parser_price_to") ?> <input type="text" name="SETTINGS[catalog][price_terms_value_to][]" value="<? echo $shs_SETTINGS["catalog"]["price_terms_value_to"]; ?>" size="10" maxlength="250"></td>
        </tr>
        <tr class="tr_add">
            <td><? echo GetMessage("parser_price_type_value") ?></td>
            <td><?= SelectBoxFromArray('SETTINGS[catalog][price_type_value][]', $arPriceValue, $shs_SETTINGS["catalog"]["price_type_value"], "", ""); ?></td>
        </tr>
        <tr class="tr_add tr_last">
            <td><? echo GetMessage("parser_price_value") ?></td>
            <td><input type="text" name="SETTINGS[catalog][price_value][]" value="<? echo $shs_SETTINGS["catalog"]["price_value"]; ?>" size="10" maxlength="250"></td>
        </tr>

    <? } ?>
    <tr class="heading">
        <td colspan="2"><? echo GetMessage("parser_size_selector") ?></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_length") ?></td>
        <td><input type="text" name="SETTINGS[catalog][selector_product][LENGTH]" value="<? echo $shs_SETTINGS["catalog"]["selector_product"]["LENGTH"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_width") ?></td>
        <td><input type="text" name="SETTINGS[catalog][selector_product][WIDTH]" value="<? echo $shs_SETTINGS["catalog"]["selector_product"]["WIDTH"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_height") ?></td>
        <td><input type="text" name="SETTINGS[catalog][selector_product][HEIGHT]" value="<? echo $shs_SETTINGS["catalog"]["selector_product"]["HEIGHT"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_size_weight") ?></td>
        <td width="60%"><input type="text" name="SETTINGS[catalog][selector_product][WEIGHT]" value="<? echo $shs_SETTINGS["catalog"]["selector_product"]["WEIGHT"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_catalog_delete_symb") ?></td>
        <td width="60%"><input type="text" name="SETTINGS[catalog][catalog_delete_selector_symb]" value="<? echo $shs_SETTINGS["catalog"]["catalog_delete_selector_symb"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"></td>
        <td width="60%">
            <?= BeginNote(); ?>
            <? echo GetMessage("parser_selector_size_descr") ?>
            <?= EndNote(); ?>
        </td>
    </tr>
    <tr class="heading">
        <td colspan="2"><? echo GetMessage("parser_size_find") ?></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_selector_find") ?></td>
        <td width="60%"><input type="text" name="SETTINGS[catalog][selector_find_size]" value="<? echo $shs_SETTINGS["catalog"]["selector_find_size"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_length") ?></td>
        <td><input type="text" name="SETTINGS[catalog][find_product][LENGTH]" value="<? echo $shs_SETTINGS["catalog"]["find_product"]["LENGTH"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_width") ?></td>
        <td><input type="text" name="SETTINGS[catalog][find_product][WIDTH]" value="<? echo $shs_SETTINGS["catalog"]["find_product"]["WIDTH"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td><? echo GetMessage("parser_size_height") ?></td>
        <td><input type="text" name="SETTINGS[catalog][find_product][HEIGHT]" value="<? echo $shs_SETTINGS["catalog"]["find_product"]["HEIGHT"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_size_weight") ?></td>
        <td width="60%"><input type="text" name="SETTINGS[catalog][find_product][WEIGHT]" value="<? echo $shs_SETTINGS["catalog"]["find_product"]["WEIGHT"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"><? echo GetMessage("parser_catalog_delete_symb") ?></td>
        <td width="60%"><input type="text" name="SETTINGS[catalog][catalog_delete_find_symb]" value="<? echo $shs_SETTINGS["catalog"]["catalog_delete_find_symb"]; ?>" size="40" maxlength="250"></td>
    </tr>
    <tr>
        <td class="field-name" width="40%"></td>
        <td width="60%">
            <?= BeginNote(); ?>
            <? echo GetMessage("parser_find_size_descr") ?>
            <?= EndNote(); ?>
        </td>
    </tr>
    <?
endif;
$tabControl->BeginNextTab();
?>
<tr>
    <td width="40%"><? echo GetMessage("parser_active_element") ?></td>
    <td width="60%"><input type="checkbox" name="ACTIVE_ELEMENT" value="Y"<? if ($shs_ACTIVE_ELEMENT == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_code_element") ?></td>
    <td width="60%"><input type="checkbox" name="CODE_ELEMENT" value="Y"<? if ($shs_CODE_ELEMENT == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_index_element") ?></td>
    <td width="60%"><input type="checkbox" name="INDEX_ELEMENT" value="Y"<? if ($shs_INDEX_ELEMENT == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_resize_image") ?></td>
    <td width="60%"><input type="checkbox" name="RESIZE_IMAGE" value="Y"<? if ($shs_RESIZE_IMAGE == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_preview_from_detail") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][img_preview_from_detail]" value="Y"<? if ($shs_SETTINGS["catalog"]["img_preview_from_detail"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_preview_from_detail_text") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][text_preview_from_detail]" value="Y"<? if ($shs_SETTINGS["catalog"]["text_preview_from_detail"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_404_error") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][404]" value="Y"<? if ($shs_SETTINGS["catalog"]["404"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_404_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_date_active") ?></td>
    <td width="60%"><input type="checkbox" name="DATE_ACTIVE" value="Y"<? if ($shs_DATE_ACTIVE && $shs_DATE_ACTIVE != "N") echo " checked" ?>> <?= SelectBoxFromArray('DATE_PROP_ACTIVE', $arrDateActive, $shs_DATE_ACTIVE, GetMessage("parser_date_type"), "id='prop-active' style='width:262px'"); ?></td>
</tr>
<? /* ?><tr>
  <td width="40%"><?echo GetMessage("parser_date_public")?></td>
  <td width="60%"><input type="checkbox" name="DATE_PUBLIC" value="Y"<?if($shs_DATE_PUBLIC && $shs_DATE_PUBLIC != "N") echo " checked"?>> <?=SelectBoxFromArray('DATE_PROP_PUBLIC', $arrProp, $shs_DATE_PUBLIC, GetMessage("parser_prop_id"), "id='prop-date' style='width:262px' class='prop-iblock'");?></td>
  </tr><? */ ?>
<tr>
    <td width="40%"><? echo GetMessage("parser_first_title") ?></td>
    <td width="60%"><input type="checkbox" name="FIRST_TITLE" value="Y"<? if ($shs_FIRST_TITLE && $shs_FIRST_TITLE != "N") echo " checked" ?>> <?= SelectBoxFromArray('FIRST_PROP_TITLE', $arrProp, $shs_FIRST_TITLE, GetMessage("parser_prop_id"), "id='prop-first' style='width:262px' class='prop-iblock'"); ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_meta_title") ?></td>
    <td width="60%"><input type="checkbox" name="META_TITLE" value="Y"<? if ($shs_META_TITLE && $shs_META_TITLE != "N") echo " checked" ?>> <?= SelectBoxFromArray('META_PROP_TITLE', $arrProp, $shs_META_TITLE, GetMessage("parser_prop_id"), "id='prop-title' style='width:262px' class='prop-iblock'"); ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_meta_description") ?></td>
    <td width="60%"><input type="checkbox" name="META_DESCRIPTION" value="Y"<? if ($shs_META_DESCRIPTION && $shs_META_DESCRIPTION != "N") echo " checked" ?>> <?= SelectBoxFromArray('META_PROP_DESCRIPTION', $arrProp, $shs_META_DESCRIPTION, GetMessage("parser_prop_id"), "id='prop-key' style='width:262px' class='prop-iblock'"); ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_meta_keywords") ?></td>
    <td width="60%"><input type="checkbox" name="META_KEYWORDS" value="Y"<? if ($shs_META_KEYWORDS && $shs_META_KEYWORDS != "N") echo " checked" ?>> <?= SelectBoxFromArray('META_PROP_KEYWORDS', $arrProp, $shs_META_KEYWORDS, GetMessage("parser_prop_id"), "id='prop-meta' style='width:262px' class='prop-iblock'"); ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_start_agent") ?></td>
    <td width="60%"><input type="checkbox" name="START_AGENT" value="Y"<? if ($shs_START_AGENT == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_start_agent_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_time_agent") ?></td>
    <td width="60%"><input type="text" size="40" name="TIME_AGENT" value="<?= $shs_TIME_AGENT ?>"></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_sleep") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][sleep]" value="<?= $shs_SETTINGS["catalog"]["sleep"] ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_sleep_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_proxy") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][proxy]" value="<?= $shs_SETTINGS["catalog"]["proxy"] ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_proxy_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<?
$tabControl->BeginNextTab();
?>
<tr>
    <td width="40%"><? echo GetMessage("parser_uniq_update") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][update][active]" value="Y"<? if ($shs_SETTINGS["catalog"]["update"]["active"] == "Y") echo " checked" ?>></td>
</tr>
<tr class="heading">
    <td colspan="2"><? echo GetMessage("parser_header_uniq") ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_uniq_name") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][uniq][name]" value="Y"<? if ($shs_SETTINGS["catalog"]["uniq"]["name"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_uniq_prop") ?></td>
    <td width="60%"><?= SelectBoxFromArray('SETTINGS[catalog][uniq][prop]', $arrProp, $shs_SETTINGS["catalog"]["uniq"]["prop"], GetMessage("parser_prop_id"), "id='style='width:262px' class='prop-iblock'"); ?></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_uniq_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr class="heading">
    <td colspan="2"><? echo GetMessage("parser_header_uniq_field") ?></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_price") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][update][price]" value="Y"<? if ($shs_SETTINGS["catalog"]["update"]["price"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_param") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][update][param]" value="Y"<? if ($shs_SETTINGS["catalog"]["update"]["param"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_preview_descr") ?></td>
    <td width="60%">
        <?= SelectBoxFromArray('SETTINGS[catalog][update][preview_descr]', $arUpdate, $shs_SETTINGS["catalog"]["update"]["preview_descr"], "", ""); ?>
        <? /* ?><input type="checkbox" name="SETTINGS[catalog][update][preview_descr]" value="Y"<?if($shs_SETTINGS["catalog"]["update"]["preview_descr"] == "Y") echo " checked"?>><? */ ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_detail_descr") ?></td>
    <td width="60%">
        <?= SelectBoxFromArray('SETTINGS[catalog][update][detail_descr]', $arUpdate, $shs_SETTINGS["catalog"]["update"]["detail_descr"], "", ""); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_preview_img") ?></td>
    <td width="60%">
        <?= SelectBoxFromArray('SETTINGS[catalog][update][preview_img]', $arUpdate, $shs_SETTINGS["catalog"]["update"]["preview_img"], "", ""); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_detail_img") ?></td>
    <td width="60%">
        <?= SelectBoxFromArray('SETTINGS[catalog][update][detail_img]', $arUpdate, $shs_SETTINGS["catalog"]["update"]["detail_img"], "", ""); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_more_img") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][update][more_img]" value="Y"<? if ($shs_SETTINGS["catalog"]["update"]["more_img"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_uniq_field_props") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][update][props]" value="Y"<? if ($shs_SETTINGS["catalog"]["update"]["props"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_header_uniq_field_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<?
$tabControl->BeginNextTab();
?>
<tr>
    <td width="40%"><? echo GetMessage("parser_auth_active") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][auth][active]" value="Y"<? if ($shs_SETTINGS["catalog"]["auth"]["active"] == "Y") echo " checked" ?>></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_auth_url") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][auth][url]" value="<?= $shs_SETTINGS["catalog"]["auth"]["url"] ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_auth_url_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_auth_selector") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][auth][selector]" value="<?= $shs_SETTINGS["catalog"]["auth"]["selector"] ?>"></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_auth_login") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][auth][login]" value="<?= $shs_SETTINGS["catalog"]["auth"]["login"] ?>"> <? echo GetMessage("parser_auth_login_name") ?> <input type="text" size="20" name="SETTINGS[catalog][auth][login_name]" value="<?= $shs_SETTINGS["catalog"]["auth"]["login_name"] ?>"></td>
</tr>
<tr>
    <td width="40%"><? echo GetMessage("parser_auth_password") ?></td>
    <td width="60%"><input type="text" size="40" name="SETTINGS[catalog][auth][password]" value="<?= $shs_SETTINGS["catalog"]["auth"]["password"] ?>"> <? echo GetMessage("parser_auth_password_name") ?> <input type="text" size="20" name="SETTINGS[catalog][auth][password_name]" value="<?= $shs_SETTINGS["catalog"]["auth"]["password_name"] ?>"></td>
</tr>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_auth_password_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<tr>
    <td width="40%"></td>
    <td width="60%"><input type="button" size="40" id="auth" name="auth" data-href="<?= $APPLICATION->GetCurPageParam("auth=1", array("auth")); ?>" value="<? echo GetMessage('parser_auth_check') ?>"></td>
</tr>
<?
$tabControl->BeginNextTab();
?>
<tr>
    <td width="40%"><? echo GetMessage("parser_header_logs") ?></td>
    <td width="60%"><input type="checkbox" name="SETTINGS[catalog][log]" value="Y"<? if ($shs_SETTINGS["catalog"]["log"] == "Y") echo " checked" ?>></td>
</tr>
<?
$file_log = $_SERVER["DOCUMENT_ROOT"] . BX_ROOT . "/modules/shs.parser/include/catalog_log_" . $_GET["ID"] . ".txt";
if (isset($_GET["ID"]) && file_exists($file_log)):
    ?>
    <tr>
        <td width="40%"><? echo GetMessage("parser_header_logs_download") ?></td>
        <td width="60%"><a href="<?= $APPLICATION->GetCurPageParam("log_ID=" . $_GET["ID"], array("log_ID")); ?>">catalog_log_<?= $_GET["ID"] ?>.txt  (<?= ceil(filesize($file_log) / 1024) ?> KB)</a></td>
    </tr>
<? endif ?>
<tr>
    <td></td>
    <td>
        <?= BeginNote(); ?>
        <? echo GetMessage("parser_header_log_descr") ?>
        <?= EndNote(); ?>
    </td>
</tr>
<?
$tabControl->BeginNextTab();
?>
<tr class="heading">
    <td colspan="2"><? echo GetMessage("parser_video_catalog_descr") ?></td>
</tr>
<tr>
    <td align="center" colspan="2" width="100%"><iframe width="800" height="500" src="//www.youtube.com/embed/vIMmjeo-xSg?list=PL2fR59TvIPXfB_XDmyp7pCnYoqQ-HhPXl" frameborder="0" allowfullscreen></iframe></td>
</tr>
<?
if (isset($_GET["log_ID"]) && isset($_GET["ID"])):
    if (ob_get_level()) {
        ob_end_clean();
    }
    $file = $file_log;
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename=' . basename($file));
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    readfile($file);
    exit();
endif;
$tabControl->Buttons(
        array(
            "disabled" => ($POST_RIGHT < "W"),
            "back_url" => "list_parser_admin.php?lang=" . LANG,
        )
);
?>
<? echo bitrix_sessid_post(); ?>
<input type="hidden" name="lang" value="<?= LANG ?>">
<? if ($ID > 0 && !$bCopy): ?>
    <input type="hidden" name="ID" value="<?= $ID ?>">
<? endif; ?>
<?
$tabControl->End();
?>

<?
$tabControl->ShowWarnings("post_form", $message);
?>