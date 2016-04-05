<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class Parser
 */
class Parser_query
{

    public $arExclusion = array();//исключения ссылок
    public $site_url;//ссылка сайта для паринга(сайт донор)
    public $file_categories;//название файла в который сохранятся ссылки на категории
    public $file_categories_page;//файл в который сохранятся ссылки постраничной навигации по категориям
    public $url_catalog;//ссылка на каталог товаров на сайте
    public $selector_catalog;//селектор товара на странице каталога "донора"
    public $selector_next;//селектор ссылки на следующую страницу постраничной навигации
    public $file_item;


    function __construct()
    {
        header("Content-Type: text/html; charset=utf-8");
        ini_set("max_execution_time", "0");
        ini_set("memory_limit", "-1");
//        get_instance();
//        $this->load->helper('url');
//        $this->load->library('session');
//        $this->config->item('base_url');
        //gc_enable();
        require_once "/public/phpQuery.php";
    }

    /**
     * categories
     *
     * @return bool
     * @author Mathew
     **/
    public function categories($site_url, $selector_catalog, $selector_next, $count)
    {
        $html = file_get_contents($site_url);
        $domain_url = parse_url($site_url);
        if (!empty($html)) {
            $document = phpQuery::newDocument($html);
            unset($html);
            foreach ($document->find($selector_catalog) as $key_index => $element_index) {
                ++$count;
                $pq = pq($element_index);
                $arLinks = (($pq->attr('href') != "#") || (in_array($pq->attr('href'), $this->arExclusion))) ? $pq->attr('href') : "";
                $GLOBALS["arLinks"][] = $arLinks;
                $GLOBALS["countrLinks"] += $count;
                if ($count == 30) {
                    self::AddItemBD($GLOBALS["arLinks"]);
                    $GLOBALS["arLinks"] = array();
                    $count = 0;
                }
            }

            $next_link = $document->find($selector_next);
            $next_link = pq($next_link)->attr('href');
            if (!empty($next_link)) {
                $next_link = $domain_url['scheme'] . '://' . $domain_url['host'] . $next_link;
                self::Categories($next_link, $selector_catalog, $selector_next, $count);
            } else {
                if (!empty($GLOBALS["arLinks"])) {
                    self::AddItemBD($GLOBALS["arLinks"]);
                }
                return json_encode(array("url_link" => $GLOBALS["arLinks"], "countrLinks" => $GLOBALS["countrLinks"]));
            }
        }
        $GLOBALS["arLinks"] = array();
    }

    public function AddItemBD($arItem)
    {
        foreach ($arItem as $item_link) {
            file_put_contents("/public/file/link" . $GLOBALS["countrLinks"] . ".txt", $item_link . "\r\n", FILE_APPEND);
        }
    }

    /*public function ItemMvideo($selector_title, $selector_price, $selector_rating)
    {
        require_once "item.php";
    }

    public function UniqueFile($file_unique)
    {
        $arUnique = file($file_unique);
        $arUnique = array_unique($arUnique);
        file_put_contents($file_unique, $arUnique);
        unset($arUnique, $file_unique);
    }*/
}