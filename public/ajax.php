<?php
require_once "Parser_query.php";

$url = filter_input(INPUT_POST, "url", FILTER_SANITIZE_STRING);
$item = filter_input(INPUT_POST, "item", FILTER_SANITIZE_STRING);
$next_link = filter_input(INPUT_POST, "next_link", FILTER_SANITIZE_STRING);

echo json_encode(array("url" => $url, "item" => $item, "next_link" => $next_link));


$pars = new Parser();

$rowSite_url = explode("\n", $url);
foreach ($rowSite_url as $cell => $site_url) {
    $pars->Categories(
        $site_url,
        $item,
        $next_link,
        0
    );
}