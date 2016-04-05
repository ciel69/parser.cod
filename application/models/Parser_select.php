<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class Parser
 */
class Parser_select extends CI_Model
{


    function __construct()
    {
        parent::__construct();
        header("Content-Type: text/html; charset=utf-8");
        ini_set("max_execution_time", "0");
        ini_set("memory_limit", "-1");
        get_instance();
        $this->load->helper('url');
        $this->load->library('session');
        $this->config->item('base_url');
        $this->load->helper('file');
        $this->load->database();
        //gc_enable();
        require_once "/public/phpQuery.php";
    }

    /**
     * categories
     *
     * @return bool
     * @author Mathew
     **/
    public function categories($arInputs, $count)
    {
        $html = file_get_contents($arInputs["site_url"]);
        $domain_url = parse_url($arInputs["site_url"]);
        $arInputs["domains"] = $domain_url['scheme'] . '://' . $domain_url['host'];
        if (!empty($html)) {
            $document = phpQuery::newDocument($html);
            unset($html);
            foreach ($document->find($arInputs["item_class"]) as $key_index => $element_index) {
                ++$count;
                $pq = pq($element_index);
                $arLinks = (($pq->attr('href') != "#") || (in_array($pq->attr('href'), $this->arExclusion))) ? $pq->attr('href') : "";
                $arLinksItems[] = $arLinks;
                if ($count == 30) {
                    foreach ($arLinksItems as $item) {
                        $arInputs["item_url"] = $arInputs["domains"] . $item;
                        self::items($arInputs);
                    }
                    $arLinksItems = array();
                    $count = 0;
                }
            }
            $next_link = $document->find($arInputs["next_link"]);
            $next_link = pq($next_link)->attr('href');
            if (!empty($next_link)) {
                sleep(1);
                $arInputs["site_url"] = $arInputs["domains"] . $next_link;
                self::categories($arInputs, $count);
            }
            foreach ($arLinksItems as $item) {
                $arInputs["item_url"] = $arInputs["domains"] . $item;
                self::items($arInputs);
            }
        }
    }

    public function items($arInputs)
    {
        $html = file_get_contents($arInputs["item_url"]);
        $document = phpQuery::newDocument($html);
        unset($html);
        foreach ($document->find($arInputs["name_item"]) as $key_index => $element_index) {
            $pq = pq($element_index);
            $arItem = array("id" => "", "url" => $pq->text(), "id_parser" => 1);
            $this->db->insert('link_items', $arItem);
            sleep(1);
        }
        $code_item = $document->find($arInputs["code_item"]);
        $code_item = explode($arInputs["exceptions"], $code_item);
        $arInputs["code"] = $code_item[1];
        self::reviews($arInputs, 0);
    }

    public function reviews($arInputs, $count)
    {
        /*if (strstr($text, $arInputs["link_reviews"])) {
            echo "Совпадение найдено.";
        } else {
            echo "Совпадение не найдено.";
        }*/
        $arInputs["link_reviews"] = str_replace("id_pars_item", $arInputs["code"], $arInputs["link_reviews"]);
        $arInputs["link_reviews"] = str_replace(array("\r", "\n", "</p>"), "", $arInputs["link_reviews"]);
        $html = file_get_contents($arInputs["domains"] . $arInputs["link_reviews"]);
        $document = phpQuery::newDocument($html);
        unset($html);
        if (empty($strAddBd)) {
            $strAddBd = "";
        }
        foreach ($document->find($arInputs["class_review"]) as $cell => $element_rev) {
            ++$count;
            $pq = pq($element_rev);
            $review = $pq->text();
            $review = str_replace(array("\r", "\n", "</p>", "<p>", '"', "'"), "", $review);
            $len_rev = strlen($review);
            if ($len_rev < 40) {
                continue;
            }
            $strAddBd .= "(null, '$review', 1),";
            if ($count == 30) {
                $strAddBd = substr($strAddBd,0,-1);
                $strAddBd .= ";";
                $this->db->query("INSERT INTO link_items (id, url, id_parser) VALUES " . $strAddBd);
                sleep(2);
                $count = 0;
                $strAddBd = "";
            }
            /*$arItem = array("id" => "", "url" => $review, "id_parser" => 1);
            $this->db->insert('link_items', $arItem);*/
//            sleep(1);
        }
        $page_rev = $document->find($arInputs["class_page_rev"]);
        $next_page = pq($page_rev)->next();
        $next_page = pq($next_page)->children()->attr("href");
        if (!empty($next_page)) {
            $arInputs["link_reviews"] = $next_page;
            self::reviews($arInputs, $count);
        }
        if(!empty($strAddBd)) {
            $strAddBd = substr($strAddBd, 0, -1);
            $strAddBd .= ";";
            $this->db->query("INSERT INTO link_items (id, url, id_parser) VALUES " . $strAddBd);
        }
    }
}