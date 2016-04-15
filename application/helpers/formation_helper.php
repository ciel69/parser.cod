<?php if (!defined('BASEPATH')) exit('No direct script access allowed');


function formation_form($values, $property)
{
    $line = "";
    if ($property[0]["type_property"] == "text") {
        $line = "<input type='text' data-lvl='" . $property[0]["lvl_property"] . "' class='" . $property[0]["class_property"] . "' value='" . $values . "' placeholder='" . $property[0]["placeholder_property"] . "'>";
    } else {
        $line = "<textarea data-lvl='" . $property[0]["lvl_property"] . "' class='" . $property[0]["class_property"] . "' placeholder='" . $property[0]["placeholder_property"] . "'>" . $values . "</textarea>";
    }
    return $line;
}

function formation_default_form($property)
{
    $line = "";
    if ($property["type_property"] == "text") {
        $line = "<input type='text' data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' value='' placeholder='" . $property["placeholder_property"] . "'>";
    } else {
        $line = "<textarea data-lvl='" . $property["lvl_property"] . "' class='" . $property["class_property"] . "' placeholder='" . $property["placeholder_property"] . "'></textarea>";
    }
    return $line;
}

function vdgu($result){
    echo '<pre>';
    var_dump($result);
    echo '</pre>';
    return;
}

