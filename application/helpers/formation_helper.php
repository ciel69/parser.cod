<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


function formation_form($property)
{   $value = !empty($property["value"]) ? $property["value"] : "";
    if ($property["type_property"] == "text") {
        echo "<input type='text' data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' value='" . $value . "' placeholder='" . $property["placeholder_property"] . "'>";
    } else {
        echo "<textarea data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' placeholder='" . $property["placeholder_property"] . "'>" . $value . "</textarea>";
    }
}

function formation_default_form($property)
{
    if ($property["type_property"] == "text") {
        echo "<input type='text' data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' value='' placeholder='" . $property["placeholder_property"] . "'>";
    } else {
        echo "<textarea data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' placeholder='" . $property["placeholder_property"] . "'></textarea>";
    }
}

function vdgu($result){
    echo '<pre>';
    var_dump($result);
    echo '</pre>';
}

function format_array_parser($property_def, $data_items){
    $newItem = array();
    $DefItem = array();
    $arDefItem = array();

    foreach ($property_def as $key => $arItem) {
        if (!empty($arItem["class_property"])) {
            $DefItem[$arItem["class_property"]] = $arItem;
        }
    }
    foreach ($data_items as $key => $arItemObjects) {
        if(!empty($arItemObjects[0])) {
            if ($key == "name_parser") {
                $arParams[$key] = $arItemObjects[0];
                continue;
            }
            if ($key == "name_source") {
                $arParams[$key] = $arItemObjects[0];
                continue;
            }
        } else {
            if ($key == "name_parser") {
                $arParams[$key] = $arItemObjects;
                continue;
            }
            if ($key == "name_source") {
                $arParams[$key] = $arItemObjects;
                continue;
            }
        }
        foreach ($arItemObjects as $objItem) {
            if (!empty($objItem["name_property"])) {
                $arParams[$objItem["name_property"]] = $objItem;
            }
        }
    }
    $newDefItem = array_replace($DefItem, $arParams);
    foreach ($newDefItem as $cell => $item) {
        if (!empty($DefItem[$cell])) {
            unset($DefItem[$cell]["value"]);
            $newDefItem[$cell] = array_replace($newDefItem[$cell], $DefItem[$cell]);
        }
    }
    return $newDefItem;
}

