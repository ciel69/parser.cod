<?
if (!isset($_REQUEST['ajax']) && !isset($_REQUEST["ajax_start"]) && !isset($_REQUEST["ajax_count"]) && !isset($_POST["auth"])):
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_admin_before.php");
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include.php");
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/prolog.php");

//require_once($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/shs.parser/classes/mysql/list_parser.php");
//require_once($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/shs.parser/classes/general/rss_content_parser.php");
    define("HELP_FILE", "add_issue.php");
    CJSCore::Init(array("jquery"));
    ?>

    <?
    if (!CModule::IncludeModule('iblock'))
        return false;
    CModule::IncludeModule('catalog');
    CModule::IncludeModule('shs.parser');

    IncludeModuleLangFile(__FILE__);
    global $shs_DEMO;
    $POST_RIGHT = $APPLICATION->GetGroupRight("shs.parser");
    if ($POST_RIGHT == "D")
        $APPLICATION->AuthForm(GetMessage("ACCESS_DENIED"));


    /* $aTabs = array(
      array("DIV" => "edit1", "TAB" => GetMessage("parser_tab"), "ICON"=>"main_user_edit", "TITLE"=>GetMessage("parser_tab")),
      array("DIV" => "edit2", "TAB" => GetMessage("parser_preview_tab"), "ICON"=>"main_user_edit", "TITLE"=>GetMessage("parser_preview_tab")),
      array("DIV" => "edit3", "TAB" => GetMessage("parser_detail_tab"), "ICON"=>"main_user_edit", "TITLE"=>GetMessage("parser_detail_tab")),
      array("DIV" => "edit4", "TAB" => GetMessage("parser_settings_tab"), "ICON"=>"main_user_edit", "TITLE"=>GetMessage("parser_settings_tab")),
      );
      $tabControl = new CAdminTabControl("tabControl", $aTabs); */


    $ID = intval($ID);        // Id of the edited record
    $bCopy = ($action == "copy");
    $message = null;
    $bVarsFromForm = false;

    /* function sotbitParserSetSettings(&$SETTINGS)
      {
      foreach($SETTINGS as &$v)
      {
      if(is_array($v)) sotbitParserSetSettings($v);
      else $v = htmlspecialcharsEx($v);
      }
      }

      function sotbitParserGetSettings(&$SETTINGS)
      {
      foreach($SETTINGS as &$v)
      {
      if(is_array($v)) sotbitParserGetSettings($v);
      else $v = htmlspecialcharsBack($v);
      }
      } */

    if ($REQUEST_METHOD == "POST" && ($save != "" || $apply != "") && $POST_RIGHT == "W" && check_bitrix_sessid()) {
        $parser = new ShsParserContent();
        RssContentParser::sotbitParserSetSettings($SETTINGS);

        $arFields = Array(
            "NAME" => $NAME,
            "TYPE" => $TYPE,
            "RSS" => $RSS,
            "SORT" => $SORT,
            "ACTIVE" => ($ACTIVE <> "Y" ? "N" : "Y"),
            "IBLOCK_ID" => $IBLOCK_ID,
            "SECTION_ID" => $SECTION_ID,
            "SELECTOR" => $SELECTOR,
            "FIRST_URL" => $FIRST_URL,
            "ENCODING" => $ENCODING,
            "PREVIEW_TEXT_TYPE" => $PREVIEW_TEXT_TYPE,
            "DETAIL_TEXT_TYPE" => $DETAIL_TEXT_TYPE,
            "PREVIEW_DELETE_TAG" => $PREVIEW_DELETE_TAG,
            "DETAIL_DELETE_TAG" => $DETAIL_DELETE_TAG,
            "PREVIEW_FIRST_IMG" => ($PREVIEW_FIRST_IMG <> "Y" ? "N" : "Y"),
            "DETAIL_FIRST_IMG" => ($DETAIL_FIRST_IMG <> "Y" ? "N" : "Y"),
            "PREVIEW_SAVE_IMG" => ($PREVIEW_SAVE_IMG <> "Y" ? "N" : "Y"),
            "DETAIL_SAVE_IMG" => ($DETAIL_SAVE_IMG <> "Y" ? "N" : "Y"),
            "BOOL_PREVIEW_DELETE_TAG" => ($BOOL_PREVIEW_DELETE_TAG <> "Y" ? "N" : "Y"),
            "BOOL_DETAIL_DELETE_TAG" => ($BOOL_DETAIL_DELETE_TAG <> "Y" ? "N" : "Y"),
            "PREVIEW_DELETE_ELEMENT" => $PREVIEW_DELETE_ELEMENT,
            "DETAIL_DELETE_ELEMENT" => $DETAIL_DELETE_ELEMENT,
            "PREVIEW_DELETE_ATTRIBUTE" => $PREVIEW_DELETE_ATTRIBUTE,
            "DETAIL_DELETE_ATTRIBUTE" => $DETAIL_DELETE_ATTRIBUTE,
            "INDEX_ELEMENT" => ($INDEX_ELEMENT <> "Y" ? "N" : "Y"),
            "CODE_ELEMENT" => ($CODE_ELEMENT <> "Y" ? "N" : "Y"),
            "RESIZE_IMAGE" => ($RESIZE_IMAGE <> "Y" ? "N" : "Y"),
            "CREATE_SITEMAP" => ($CREATE_SITEMAP <> "Y" ? "N" : "Y"),
            "DATE_ACTIVE" => ($DATE_ACTIVE <> "Y" ? "N" : $DATE_PROP_ACTIVE),
            "DATE_PUBLIC" => ($DATE_PUBLIC <> "Y" ? "N" : $DATE_PROP_PUBLIC),
            "FIRST_TITLE" => ($FIRST_TITLE <> "Y" ? "N" : $FIRST_PROP_TITLE),
            "META_TITLE" => ($META_TITLE <> "Y" ? "N" : $META_PROP_TITLE),
            "META_DESCRIPTION" => ($META_DESCRIPTION <> "Y" ? "N" : $META_PROP_DESCRIPTION),
            "META_KEYWORDS" => ($META_KEYWORDS <> "Y" ? "N" : $META_PROP_KEYWORDS),
            "START_AGENT" => ($START_AGENT <> "Y" ? "N" : "Y"),
            "TIME_AGENT" => $TIME_AGENT,
            "ACTIVE_ELEMENT" => ($ACTIVE_ELEMENT <> "Y" ? "N" : "Y"),
            "SETTINGS" => base64_encode(serialize($SETTINGS))
                //"START_LAST_TIME" => $START_LAST_TIME
        );

        if ($ID > 0) {
            $res = $parser->Update($ID, $arFields);
        } else {
            $ID = $parser->Add($arFields);
            $res = ($ID > 0);
        }

        if ($res) {
            if ($apply != "")
                LocalRedirect("/bitrix/admin/parser_edit.php?ID=" . $ID . "&mess=ok&lang=" . LANG . "&tabControl_active_tab=" . $_POST["tabControl_active_tab"]);
            else
                LocalRedirect("/bitrix/admin/list_parser_admin.php?lang=" . LANG);
        }
        else {
            if ($e = $APPLICATION->GetException())
                $message = new CAdminMessage(GetMessage("parser_save_error"), $e);
            $bVarsFromForm = true;
        }
    }
//Edit/Add part
    ClearVars();


    if ($ID > 0 || $copy) {
        if ($ID)
            $parser = ShsParserContent::GetByID($ID);
        elseif ($copy)
            $parser = ShsParserContent::GetByID($copy);
        if (!$parser->ExtractFields("shs_"))
            $ID = 0;
        if ($ID > 0 && $shs_TIME_AGENT > 0) {
            $arAgent = CAgent::GetList(array(), array("NAME" => "CShsParser::startAgent(" . $ID . ");"))->Fetch();
            if (!$arAgent && $shs_START_AGENT == "Y") {
                CAgent::AddAgent(
                        "CShsParser::startAgent(" . $ID . ");", // имя функции
                        "shs.parser", // идентификатор модуля
                        "N", // агент не критичен к кол-ву запусков
                        $shs_TIME_AGENT, // интервал запуска - 1 сутки
                        "", // дата первой проверки на запуск
                        "Y", // агент активен
                        "", // дата первого запуска
                        100
                );
            } elseif ($arAgent) {
                CAgent::Update($arAgent['ID'], array(
                    "AGENT_INTERVAL" => $shs_TIME_AGENT,
                    "ACTIVE" => $shs_START_AGENT == "Y" ? "Y" : "N"
                ));
            }
        }


        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $shs_IBLOCK_ID, "PROPERTY_TYPE" => "S"));
        while ($arProp = $properties->Fetch()) {   //printr($arProp);
            $arrProp['REFERENCE'][] = "[" . $arProp["CODE"] . "] " . $arProp["NAME"];
            $arrProp['REFERENCE_ID'][] = $arProp["CODE"];
        }

        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $shs_IBLOCK_ID, "PROPERTY_TYPE" => "F"));
        while ($arProp = $properties->Fetch()) {
            $arrPropFile['REFERENCE'][] = "[" . $arProp["CODE"] . "] " . $arProp["NAME"];
            $arrPropFile['REFERENCE_ID'][] = $arProp["CODE"];
        }

        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $shs_IBLOCK_ID));
        while ($arProp = $properties->Fetch()) {

            if ($arProp["PROPERTY_TYPE"] == "L" || $arProp["PROPERTY_TYPE"] == "N" || $arProp["PROPERTY_TYPE"] == "S" || $arProp["PROPERTY_TYPE"] == "E") {
                $arrPropDop['REFERENCE'][] = $arProp["NAME"];
                $arrPropDop['REFERENCE_ID'][] = $arProp["CODE"];
                $arrPropDop['REFERENCE_TYPE'][$arProp["CODE"]] = $arProp["PROPERTY_TYPE"];
            }

            if ($arProp["PROPERTY_TYPE"] == "L"/* && $arProp["ID"]==14 */) {
                $rsEnum = CIBlockPropertyEnum::GetList(Array("DEF" => "DESC", "SORT" => "ASC"), Array("IBLOCK_ID" => $shs_IBLOCK_ID, "property_id" => $arProp["ID"]));
                $arrPropDop["LIST_VALUES"][$arProp["CODE"]]["REFERENCE"][] = GetMessage("parser_prop_default");
                $arrPropDop["LIST_VALUES"][$arProp["CODE"]]["REFERENCE_ID"][] = "";
                while ($arEnum = $rsEnum->Fetch()) {
                    //printr($arEnum);
                    $arrPropDop["LIST_VALUES"][$arProp["CODE"]]["REFERENCE"][] = $arEnum["VALUE"];
                    $arrPropDop["LIST_VALUES"][$arProp["CODE"]]["REFERENCE_ID"][] = $arEnum["ID"];
                }
                //printr($arEnum);
            }
        }
    }

    if ($bVarsFromForm)
        $DB->InitTableVarsForEdit("b_shs_list_parser", "", "shs_");

    $APPLICATION->SetTitle(($ID > 0 ? GetMessage("parser_title_edit") : GetMessage("parser_title_add")));
    require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_admin_after.php");

    $aMenu = array(
        array(
            "TEXT" => GetMessage("parser_list"),
            "TITLE" => GetMessage("parser_list_title"),
            "LINK" => "list_parser_admin.php?lang=" . LANG,
            "ICON" => "btn_list",
        )
    );
    if ($ID > 0) {
        $aMenu[] = array("SEPARATOR" => "Y");
        $aMenu[] = array(
            "TEXT" => GetMessage("parser_add"),
            "TITLE" => GetMessage("rubric_mnu_add"),
            "LINK" => "parser_edit.php?lang=" . LANG,
            "ICON" => "btn_new",
        );
        $aMenu[] = array(
            "TEXT" => GetMessage("parser_copy"),
            "TITLE" => GetMessage("rubric_mnu_copy"),
            "LINK" => "parser_edit.php?copy=" . $ID . "&lang=" . LANG,
            "ICON" => "btn_copy",
        );
        $aMenu[] = array(
            "TEXT" => GetMessage("parser_delete"),
            "TITLE" => GetMessage("parser_mnu_del"),
            "LINK" => "javascript:if(confirm('" . GetMessage("parser_mnu_del_conf") . "'))window.location='list_parser_admin.php?ID=" . $ID . "&action=delete&lang=" . LANG . "&" . bitrix_sessid_get() . "';",
            "ICON" => "btn_delete",
        );

        if ($shs_ACTIVE == "Y") {
            $aMenu[] = array("SEPARATOR" => "Y");
            if ($shs_TYPE == "catalog" || $_GET["type"] == "catalog"):
                $aMenu[] = array(
                    "TEXT" => GetMessage("parser_start"),
                    "TITLE" => GetMessage("parser_start_title"),
                    "LINK" => "parser_edit.php?start=1&lang=" . LANG . "&ID=" . $ID,
                    "ICON" => "btn_start_catalog"
                );
            else:
                $aMenu[] = array(
                    "TEXT" => GetMessage("parser_start"),
                    "TITLE" => GetMessage("parser_start_title"),
                    "LINK" => "parser_edit.php?start=1&lang=" . LANG . "&ID=" . $ID,
                    "ICON" => "btn_start"
                );
            endif;
        }
        if ($shs_TYPE == "catalog" || $_GET["type"] == "catalog") {
            $aMenu[] = array(
                "TEXT" => GetMessage("parser_instructions"),
                "TITLE" => GetMessage("parser_instructions_title"),
                "LINK" => "http://www.sotbit.ru/info/articles/instruktsiya-polzovatelya-pri-rabote-s-modulem-parser-kontenta-v-rezhime-kataloga.html",
                "ICON" => "instruction"
            );
        }
    }
    $context = new CAdminContextMenu($aMenu);
    $context->Show();


    if (isset($_REQUEST['start']) && $ID > 0) {
        $rssParser = new RssContentParser();
        $result = $rssParser->startParser();
        if (isset($result[SUCCESS][0]))
            foreach ($result[SUCCESS] as $i => $success) {
                $resultUrl .= "&SUCCESS[" . $i . "]=" . urlencode($success);
            }
        if (isset($result[ERROR][0]))
            foreach ($result[ERROR] as $i => $error) {
                $resultUrl .= "&ERROR[" . $i . "]=" . urlencode($error);
            }
        if (!RssContentParser::TEST)
            LocalRedirect($APPLICATION->GetCurPageParam("end=1" . $resultUrl, array("start")));
    }

    if ($shs_TYPE == "catalog" || $_GET["type"] == "catalog") {
        $isOfferCatalog = false;
        if (isset($shs_IBLOCK_ID) && $shs_IBLOCK_ID && CModule::IncludeModule('catalog')) {
            $arIblock = CCatalogSKU::GetInfoByIBlock($shs_IBLOCK_ID);
            if (is_array($arIblock) && !empty($arIblock) && $arIblock["PRODUCT_IBLOCK_ID"] != 0 && $arIblock["SKU_PROPERTY_ID"] != 0)
                $isOfferCatalog = true;
        }

        if (CModule::IncludeModule('catalog') && (($shs_IBLOCK_ID && CCatalog::GetList(Array("name" => "asc"), Array("ACTIVE" => "Y", "ID" => $shs_IBLOCK_ID))->Fetch()) || (is_array($arIblock) && !empty($arIblock) && $arIblock["PRODUCT_IBLOCK_ID"] != 0 && $arIblock["SKU_PROPERTY_ID"] != 0) || !$shs_IBLOCK_ID)) {
            //unset($aTabs[5]);
            $aTabs = array(
                array("DIV" => "edit1", "TAB" => GetMessage("parser_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_tab")),
                array("DIV" => "edit2", "TAB" => GetMessage("parser_pagenavigation_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_pagenavigation_tab")),
                array("DIV" => "edit3", "TAB" => GetMessage("parser_preview_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_preview_tab")),
                array("DIV" => "edit4", "TAB" => GetMessage("parser_detail_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_detail_tab")),
                array("DIV" => "edit5", "TAB" => GetMessage("parser_props_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_props_tab")),
                array("DIV" => "edit6", "TAB" => GetMessage("parser_catalog_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_catalog_tab")),
                array("DIV" => "edit7", "TAB" => GetMessage("parser_settings_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_settings_tab")),
                array("DIV" => "edit8", "TAB" => GetMessage("parser_uniq_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_uniq_tab")),
                array("DIV" => "edit9", "TAB" => GetMessage("parser_auth"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_auth")),
                array("DIV" => "edit10", "TAB" => GetMessage("parser_logs_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_logs_tab")),
                array("DIV" => "edit11", "TAB" => GetMessage("parser_video_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_video_tab")),
            );
            $isCatalog = true;
        } else {
            $aTabs = array(
                array("DIV" => "edit1", "TAB" => GetMessage("parser_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_tab")),
                array("DIV" => "edit2", "TAB" => GetMessage("parser_pagenavigation_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_pagenavigation_tab")),
                array("DIV" => "edit3", "TAB" => GetMessage("parser_preview_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_preview_tab")),
                array("DIV" => "edit4", "TAB" => GetMessage("parser_detail_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_detail_tab")),
                array("DIV" => "edit5", "TAB" => GetMessage("parser_props_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_props_tab")),
                array("DIV" => "edit7", "TAB" => GetMessage("parser_settings_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_settings_tab")),
                array("DIV" => "edit8", "TAB" => GetMessage("parser_uniq_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_uniq_tab")),
                array("DIV" => "edit9", "TAB" => GetMessage("parser_auth"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_auth")),
                array("DIV" => "edit10", "TAB" => GetMessage("parser_logs_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_logs_tab")),
                array("DIV" => "edit11", "TAB" => GetMessage("parser_video_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_video_tab")),
            );
            $isCatalog = false;
        }

        //$rsIBlock = CCatalog::GetList(Array("name" => "asc"), Array("ACTIVE"=>"Y"));
        $rsIBlock = CIBlock::GetList(Array("name" => "asc"), Array("ACTIVE" => "Y"));
        while ($arr = $rsIBlock->Fetch()) {
            $arIBlock['REFERENCE'][] = "[" . $arr["ID"] . "] " . $arr["NAME"];
            $arIBlock['REFERENCE_ID'][] = $arr["ID"];
        }
    } else {
        $rsIBlock = CIBlock::GetList(Array("name" => "asc"), Array("ACTIVE" => "Y"));
        while ($arr = $rsIBlock->Fetch()) {
            $arIBlock['REFERENCE'][] = "[" . $arr["ID"] . "] " . $arr["NAME"];
            $arIBlock['REFERENCE_ID'][] = $arr["ID"];
        }

        $aTabs = array(
            array("DIV" => "edit1", "TAB" => GetMessage("parser_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_tab")),
            array("DIV" => "edit2", "TAB" => GetMessage("parser_preview_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_preview_tab")),
            array("DIV" => "edit3", "TAB" => GetMessage("parser_detail_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_detail_tab")),
            array("DIV" => "edit4", "TAB" => GetMessage("parser_settings_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_settings_tab")),
            array("DIV" => "edit5", "TAB" => GetMessage("parser_video_tab"), "ICON" => "main_user_edit", "TITLE" => GetMessage("parser_video_tab")),
        );
    }
    $tabControl = new CAdminTabControl("tabControl", $aTabs);



    if (!empty($shs_IBLOCK_ID)) {
        $rsSections = CIBlockSection::GetList(array("left_margin" => "asc"), array('ACTIVE' => "Y", "IBLOCK_ID" => $shs_IBLOCK_ID), false, array('ID', 'NAME', "IBLOCK_ID", "DEPTH_LEVEL"));

        while ($arr = $rsSections->Fetch()) {
            $arr["NAME"] = str_repeat(" . ", $arr["DEPTH_LEVEL"]) . $arr["NAME"];
            $arSection['REFERENCE'][] = $arr["NAME"];
            $arSection['REFERENCE_ID'][] = $arr["ID"];
        }
    }
    $arrDateActive['REFERENCE'][0] = GetMessage("parser_date_active_now");
    $arrDateActive['REFERENCE'][1] = GetMessage("parser_date_active_now_time");
    $arrDateActive['REFERENCE'][2] = GetMessage("parser_date_active_public");
    $arrDateActive['REFERENCE_ID'][0] = "NOW";
    $arrDateActive['REFERENCE_ID'][1] = "NOW_TIME";
    $arrDateActive['REFERENCE_ID'][2] = "PUBLIC";
    ?>
    <a target="blank" href=""><?= GetMessage("parser_instruction") ?></a>
    <div id="status_bar" style="display:none;overflow:hidden;">
        <div id="progress_bar" style="width: 500px;float:left;" class="adm-progress-bar-outer">
            <div id="progress_bar_inner" style="width: 0px;" class="adm-progress-bar-inner"></div>
            <div id="progress_text" style="width: 500px;" class="adm-progress-bar-inner-text">0%</div>
        </div>
        <div id="catalog_bar" style="float:left;width:700px;height:35px;line-height:35px;font-weight:bold;margin-left:30px;"></div>
        <div id="current_test"></div>
    </div>
    <div style="clear:both;"></div>
    <?
    if (isset($_REQUEST["mess"]) && $_REQUEST["mess"] == "ok" && $ID > 0)
        CAdminMessage::ShowMessage(array("MESSAGE" => GetMessage("parser_saved"), "TYPE" => "OK"));

    if ($message)
        echo $message->Show();
    elseif ($rubric->LAST_ERROR != "")
        CAdminMessage::ShowMessage($rubric->LAST_ERROR);

    if (isset($_REQUEST['end']) && $_REQUEST['end'] == 1 && $ID > 0) {
        if (isset($_GET['SUCCESS'][0])) {
            foreach ($_GET['SUCCESS'] as $success)
                CAdminMessage::ShowMessage(array("MESSAGE" => $success, "TYPE" => "OK"));
        }
        if (isset($_GET['ERROR'][0])) {
            foreach ($_GET['ERROR'] as $error)
                CAdminMessage::ShowMessage($error);
        }
    }
    $shs_SETTINGS = (string) $shs_SETTINGS;
    $shs_SETTINGS = unserialize(base64_decode($shs_SETTINGS));

    $shsDebug = $shs_SETTINGS["catalog"]["mode"];


    if ($shs_DEMO == 2)
        CAdminMessage::ShowMessage(array("MESSAGE" => GetMessage("parser_demo")));
    if ($shs_DEMO == 3)
        CAdminMessage::ShowMessage(array("MESSAGE" => GetMessage("parser_demo_end")));
    ?>
    <div id="shs_message"></div>
    <form method="POST" id="shs-parser" Action="<? echo $APPLICATION->GetCurPage() ?>" ENCTYPE="multipart/form-data" name="post_form">
    <?
    $tabControl->Begin();


    if ($shs_TYPE == "page" || (isset($_GET["type"]) && $_GET["type"] == "page"))
        include("parser_edit_page.php");
    elseif ($shs_TYPE == "catalog" || (isset($_GET["type"]) && $_GET["type"] == "catalog"))
        include("parser_edit_catalog.php");
    elseif ((!$shs_TYPE && $ID) || $shs_TYPE == "rss" || (isset($_GET["type"]) && $_GET["type"] == "rss") || !isset($ID) || !$ID)
        include("parser_edit_rss.php");
    ?>






        <? echo BeginNote(); ?>
        <span class="required">*</span><? echo GetMessage("REQUIRED_FIELDS") ?>
        <? echo EndNote(); ?>    
        <script language="JavaScript">
            jQuery(document).ready(function () {
                $("#instruction").attr("target", "_blank");
                $(".prop_delete").live("click", function (e) {
                    e.preventDefault();
                    tr = $(this).parents("tr").eq(0);
                    tr.hide();
                    tr.find("input").val("");
                    v = tr.find("input").attr("data-code");
                    prev = $("#delete_selector_prop").val();
                    $("#delete_selector_prop").val(prev + "," + v);
                });

                $(".find_delete").live("click", function (e) {
                    e.preventDefault();
                    tr = $(this).parents("tr").eq(0);
                    tr.hide();
                    tr.find("input").val("");
                    v = tr.find("input").attr("data-code");
                    prev = $("#delete_find_prop").val();
                    $("#delete_find_prop").val(prev + "," + v);
                })

                $(".show_prop").live("click", function (e) {
                    e.preventDefault();
                    id = $(this).attr("data-name");
                    $("#" + id).val("");
                    tr = $(this).parents("tr").eq(0);
                    if (!tr.is("#header_find_prop"))
                        tr.nextAll().not("#header_find_prop~tr").show();
                    else
                        tr.nextAll().show();
                })

                $(".add_usl").live("click", function (e) {
                    e.preventDefault();

                    tr = $(".tr_add").clone();
                    console.log(tr);
                    n = parseInt($(".tr_add.heading").attr("data-num"));
                    $(".tr_add").removeClass("tr_add");
                    $(".tr_last").after(tr);
                    $(".tr_last").not(".tr_add").removeClass("tr_last");
                    $(this).remove();
                    $(".tr_add.heading").attr("data-num", n + 1);
                    $(".tr_add.heading span").text(n + 1);
                    $(".tr_add .del_usl").show();
                })

                $("#auth").live("click", function (e) {
                    e.preventDefault();
                    url = $(this).attr("data-href");
                    jQuery.ajax({
                        url: url,
                        type: "POST",
                        data: "auth=1",
                        dataType: 'html',
                        success: function (data) {
                            $("#shs_message").html(data);
                        }

                    })
                })

                $(".del_usl").live("click", function (e) {
                    e.preventDefault();
                    tr = $(this).parents(".heading").eq(0);
                    if (tr.is(".tr_add"))
                    {
                        tr.prev().addClass("tr_last");
                        bool = false;
                        tr.prevAll("tr").each(function () {
                            if (!bool)
                                $(this).addClass("tr_add");
                            if ($(this).is(".heading") && !bool)
                            {
                                bool = true;
                                attr = parseInt($(this).attr("data-num"));
                                if (attr != 1)
                                    $(this).html(tr.html());
                            }

                        })
                    }
                    bool = false;
                    tr.nextAll("tr").each(function () {
                        if ($(this).is(".heading"))
                            bool = true;
                        if (!bool)
                            $(this).remove();
                    })
                    tr.remove();
                })

                jQuery('#iblock').change(function () {
                    iblock = jQuery(this).val();
                    jQuery.ajax({
                        url: "",
                        type: "POST",
                        data: 'ajax=1&iblock=' + iblock,
                        dataType: 'html',
                        success: function (data) {
                            var ar = new Array();
                            ar = data.split("#SOTBIT#");
                            $('#section').html(ar[0]);
                            $(".prop-iblock").html(ar[1]);
                            $("#edit5 .image_props").html(ar[4]);
                            $("#edit5 #header_selector_prop+tr+tr").nextAll().not("#header_find_prop, .tr_find_prop").remove();
                            $("#edit5 #header_find_prop+tr+tr+tr").nextAll().not(".tr_find_prop").remove();
                            $("#edit5 #header_selector_prop+tr+tr").after(ar[2]);
                            $("#edit5 #header_find_prop+tr+tr+tr").after(ar[3]);
                        }

                    })

                })

                $('.bool-delete').change(function () {
                    if ($(this).prop('checked')) {
                        $(this).next().removeAttr('disabled');
                        $(this).next().next().removeAttr('disabled');
                    }
                    else {
                        $(this).next().val("");
                        $(this).next().attr('disabled', "");

                        $(this).next().next().val("");
                        $(this).next().next().attr('disabled', "");
                    }
                })

                $('.number_img').change(function () {
                    if (!$(this).prop('checked')) {
                        $(this).next().removeAttr('disabled');
                        $(this).next().next().removeAttr('disabled');
                    }
                    else {
                        $(this).next().val("");
                        $(this).next().attr('disabled', "");

                        $(this).next().next().val("");
                        $(this).next().next().attr('disabled', "");

                    }
                })

                $("#TYPE").change(function (e) {
                    href = location.href;
                    location.href = href + '&type=' + $(this).val();
                })

                $("#btn_stop_catalog").live("click", function (e) {
                    e.preventDefault();

                })
                var ajaxInterval;
                var sotbitStop;
                var sotbitStopStart;
                var href1, href2;
                var debug = 0;
    <? if ($shsDebug == "debug"): ?>
                    debug = 1;
    <? endif; ?>

                function sotbitAjaxCatalog(href2, start)
                {
                    if (start == 1)
                    {
                        sotbitStopStart = 0;
                        href = href2 + "&begin=1";
                        sotbitStop = 0;
                    }
                    else
                        href = href2;
                    BX.ajax.get(href, "", function (data) {
                        //clearInterval(ajaxInterval);
                        prog = 100;
                        $('#progress_text').html(prog + '%');
                        $('#progress_bar_inner').width(500 * prog / 100);
                        //$("#status_bar").hide();
                        $('#progress_text').html(100 + '%');
                        if (data != "stop")
                            $("#shs_message").html(data);
                        //if(sotbitStop!=1)sotbitAjaxCatalog(href2, 0);
                        //else sotbitStop = 0;
                        if (data != "stop" && sotbitStopStart != 1 && debug != 1)
                            sotbitAjaxCatalog(href2, 0);
                        else
                        {
                            if (sotbitStopStart == 1)
                                sotbitStop = 1;
                            //if(debug==1) 
                            sotbitStop = 1;
                            $("#btn_stop_catalog").attr("id", "btn_start_catalog");
                            $("#btn_start_catalog").text(<? echo '"' . GetMessage("parser_start") . '"' ?>);
                            setTimeout(function () {
                                sotbitCountAjax(href1, 1);
                            }, 1000)

                        }

                    })
                }

                $("#btn_stop_catalog").live("click", function (e) {
                    e.preventDefault();
                    sotbitStopStart = 1;
                })

                $("#btn_start_catalog").live('click', function (e) {   //alert("test");
                    e.preventDefault();
                    $(this).attr("id", "btn_stop_catalog");
                    $("#status_bar").show();
                    $(this).text(<? echo '"' . GetMessage("btn_stop_catalog") . '"' ?>);
                    href1 = $(this).attr("href") + "&ajax_count=1&type=catalog";
                    href2 = $(this).attr("href") + "&ajax_start=1&type=catalog";

                    //ajaxInterval = setInterval(function(){
                    sotbitCountAjax(href1, 0);
                    //}, 1000);



                    sotbitAjaxCatalog(href2, 1);

                    return false;

                })

                function sotbitCountAjax(href1, num)
                {
                    BX.ajax.post(href1, "sessid=" + BX.bitrix_sessid(), function (data) {
                        arData = data.split("|");
                        if (sotbitStop != 1)
                        {
                            if (arData[1] > 0)
                                prog = Math.ceil((arData[1] / arData[0]) * 100);
                            else
                                prog = 0;
                            $('#progress_text').html(prog + '%');
                            $('#progress_bar_inner').width(500 * prog / 100);
                        }

                        page = arData[2];
                        elements = arData[3];
                        elementError = arData[4];
                        allError = arData[5];
                        if (sotbitStop != 1)
                            sotbitStop = parseInt(arData[6]);
                        msg = <? echo '"' . GetMessage("parser_load_page") . '"' ?> + page +<? echo '"' . GetMessage("parser_load_product") . '"' ?> + elements +<? echo '"<span style=\"color:red\">' . GetMessage("parser_load_product_error") . '"' ?> + elementError + '</span>' +<? echo '"<span style=\"color:red\">' . GetMessage("parser_all_error") . '"' ?> + allError + '</span>';
                        $("#catalog_bar").html(msg);
                        if (sotbitStop == 1)
                        {
                            prog = 100;
                            $('#progress_text').html(prog + '%');
                            $('#progress_bar_inner').width(500 * prog / 100);
                            $('#progress_text').html(<? echo '"' . GetMessage("parser_loading_end") . '"' ?>);
                        } else
                            sotbitCountAjax(href1, 0);


                    })
                }

            })

            BX.ready(function () {

                BX.bind(BX('btn_start'), 'click', function (e) {
                    e.preventDefault();
                    BX.show(BX('status_bar'));
                    var href1 = BX(this).getAttribute("href") + "&ajax_count=1";
                    var href2 = BX(this).getAttribute("href") + "&ajax_start=1";

                    var ajaxInterval = setInterval(function () {
                        BX.ajax.post(href1, "sessid=" + BX.bitrix_sessid(), function (data) {
                            arData = data.split("|");
                            if (arData[1] > 0)
                                prog = Math.ceil((arData[1] / arData[0]) * 100);
                            else
                                prog = 0;
                            BX('progress_text').innerHTML = prog + '%';
                            BX('progress_bar_inner').style.width = 500 * prog / 100 + 'px';
                            if (prog == 1)
                                clearInterval(ajaxInterval);
                        })
                    }, 500);


                    BX.ajax.get(href2, "", function (data) {
                        clearInterval(ajaxInterval);
                        prog = 100;
                        BX('progress_text').innerHTML = prog + '%';
                        BX('progress_bar_inner').style.width = 500 * prog / 100 + 'px';
                        BX.hide(BX('status_bar'));
                        BX('progress_text').innerHTML = 0 + '%';
                        BX("shs_message").innerHTML = data;

                    })

                    return false;

                })


            })
        </script>
    <? require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/epilog_admin.php"); ?>
<?
elseif (isset($_REQUEST["ajax_start"]) && isset($_REQUEST["ID"]) && isset($_REQUEST["start"]) && !isset($_REQUEST["ajax_count"])):
    set_time_limit(0);
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_admin_before.php");
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include.php");
    require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/prolog.php");
    IncludeModuleLangFile(__FILE__);
    if (CModule::IncludeModule('iblock') && CModule::IncludeModule('main')):
        $parser = ShsParserContent::GetByID($ID);
        if (!$parser->ExtractFields("shs_"))
            $ID = 0;
        $rssParser = new RssContentParser();
        $result = $rssParser->startParser(0);
    endif;
    ?>
    <?
    elseif (isset($_REQUEST["ID"]) && isset($_REQUEST["start"]) && isset($_REQUEST["ajax_count"])):
        set_time_limit(0);
        $file = $_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include/count_parser" . $_REQUEST["ID"] . ".txt";
        if (isset($_REQUEST["ID"]) && file_exists($file)) {
            $count = file_get_contents($file);
            echo $count;
        } else {
            echo "0|0";
        }
        if ($_GET["type"] == "catalog") {
            $file1 = $_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include/count_parser_catalog" . $_REQUEST["ID"] . ".txt";
            if (isset($_REQUEST["ID"]) && file_exists($file1)) {
                $count = file_get_contents($file1);
                echo $count;
            } else {
                echo "|0|0|0|0";
            }
            $file2 = $_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include/catalog_parser_current_page" . $_REQUEST["ID"] . ".txt";
            if (isset($_REQUEST["ID"]) && file_exists($file2)) {
                $content = file_get_contents($file2);
                if ($content == "") {
                    echo "|1";
                    unlink($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include/catalog_parser_current_page" . $_REQUEST["ID"] . ".txt");
                }
            }
        }
        //print_r(array($_REQUEST["ID"], file_exists($file), $file));
        ?>
    <? elseif (isset($_REQUEST["iblock"])):
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_admin_before.php");
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include.php");
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/prolog.php");
        IncludeModuleLangFile(__FILE__);
        CModule::IncludeModule('iblock');
        $rsSections = CIBlockSection::GetList(array("left_margin" => "asc"), array('ACTIVE' => "Y", "IBLOCK_ID" => $_REQUEST["iblock"]), false, array('ID', 'NAME', "IBLOCK_ID", "DEPTH_LEVEL"));

        $first = true;
        echo '<option value="">' . GetMessage("parser_section_id") . '</option>';
        while ($arr = $rsSections->Fetch()) {
            $arr["NAME"] = str_repeat(" . ", $arr["DEPTH_LEVEL"]) . $arr["NAME"];
            echo '<option value="' . $arr["ID"] . '">' . $arr["NAME"] . '</option>';
        }
        echo '#SOTBIT#<option value="">' . GetMessage("parser_prop_id") . '</option>';
        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $_REQUEST['iblock'], "PROPERTY_TYPE" => "S"));
        while ($arProp = $properties->Fetch()) {
            echo '<option value="' . $arProp["CODE"] . '">' . "[" . $arProp["CODE"] . "] " . $arProp["NAME"] . '</option>';
        }




        echo '#SOTBIT#';
        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $_REQUEST['iblock']));
        while ($arProp = $properties->Fetch()) {
            if ($arProp["PROPERTY_TYPE"] == "S" || $arProp["PROPERTY_TYPE"] == "L" || $arProp["PROPERTY_TYPE"] == "N" || $arProp["PROPERTY_TYPE"] == "E") {
                $arPropsDop[] = $arProp;
            }

            //echo '<option value="'.$arProp["CODE"].'">'."[".$arProp["CODE"]."] ".$arProp["NAME"].'</option>';
        }
        foreach ($arPropsDop as $val) {
            echo '<tr><td width="40%" class="adm-detail-content-cell-l">' . $val["NAME"] . '&nbsp;[' . $val["CODE"] . ']:</td><td width="60%" class="adm-detail-content-cell-r"><input data-code="' . $val["CODE"] . '" size="40" type="text" value="" name="SETTINGS[catalog][selector_prop][' . $val["CODE"] . ']">&nbsp;<a class="prop_delete" href="#">Delete</a></td></tr>';
        }
        echo '#SOTBIT#';
        foreach ($arPropsDop as $val) {
            echo '<tr><td width="40%" class="adm-detail-content-cell-l">' . $val["NAME"] . '&nbsp;[' . $val["CODE"] . ']:</td><td width="60%" class="adm-detail-content-cell-r"><input data-code="' . $val["CODE"] . '" size="40" type="text" value="" name="SETTINGS[catalog][find_prop][' . $val["CODE"] . ']">&nbsp;<a class="find_delete" href="#">Delete</a></td></tr>';
        }

        echo '#SOTBIT#<option value="">' . GetMessage("parser_prop_id") . '</option>';
        $properties = CIBlockProperty::GetList(Array("sort" => "asc", "name" => "asc"), Array("ACTIVE" => "Y", "IBLOCK_ID" => $_REQUEST['iblock'], "PROPERTY_TYPE" => "F"));
        while ($arProp = $properties->Fetch()) {
            echo '<option value="' . $arProp["CODE"] . '">' . "[" . $arProp["CODE"] . "] " . $arProp["NAME"] . '</option>';
        } elseif (isset($_POST["auth"])):
        set_time_limit(0);
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_admin_before.php");
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/include.php");
        require_once($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/shs.parser/prolog.php");
        IncludeModuleLangFile(__FILE__);
        if (CModule::IncludeModule('iblock') && CModule::IncludeModule('main')):
            $parser = ShsParserContent::GetByID($ID);
            if (!$parser->ExtractFields("shs_"))
                $ID = 0;
            $rssParser = new RssContentParser();
            $rssParser->auth(true);
        endif;
    endif;
    ?>