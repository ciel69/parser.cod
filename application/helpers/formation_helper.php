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

