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
        $this->load->library(array('generator_color'));
        $this->config->item('base_url');
        $this->load->helper(array('file', 'url', 'translit','formation'));
        $this->load->database();

        require_once "./public/phpQuery.php";
    }

    public function get_properties($arInputs)
    {
        $html = file_get_contents($arInputs["site_url"]);
        $domain_url = parse_url($arInputs["site_url"]);
        $arInputs['scheme'] = $domain_url['scheme'];
        $arInputs["domains"] = $domain_url['scheme'] . '://' . $domain_url['host'];

        if (!empty($html)) {
            $document = phpQuery::newDocument($html);

            unset($html);

            foreach ($document->find($arInputs["class_item"]) as $key_index => $element_index) {
                $pq = pq($element_index);
                $link = $pq->attr('href');
                $arInputs["item_url"] = $arInputs["domains"] . $link;
                $property = $this->get_property_item($arInputs);
                break;
            }
        }
        return $property;
    }

    private function get_property_item($arInputs)
    {
        $arProperty = array();
        $html = file_get_contents($arInputs["item_url"]);
        $document = phpQuery::newDocument($html);

        unset($html);

        foreach ($document->find($arInputs["table_property"]) as $key => $element) {
            $arProperty[$key]["name"] = pq(pq($element)->children('td')->get(0))->text();
            $arProperty[$key]["value"] = pq(pq($element)->children('td')->get(1))->text();
        }
        
        return $arProperty;
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
        $arInputs['scheme'] = $domain_url['scheme'];
        $arInputs["domains"] = $domain_url['scheme'] . '://' . $domain_url['host'];

        if (!empty($html)) {
            $document = phpQuery::newDocument($html);
            unset($html);
            foreach ($document->find($arInputs["class_item"]) as $key_index => $element_index) {
                ++$count;
                $pq = pq($element_index);
                $arLinks = $pq->attr('href');
                $arLinksItems[] = $arLinks;
                if ($count == 30) {
                    foreach ($arLinksItems as $item) {
                        $arInputs["item_url"] = $arInputs["domains"] . $item;
                        $this->items($arInputs);
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
                $this->categories($arInputs, $count);
            }

            foreach ($arLinksItems as $item) {
                $arInputs["item_url"] = $arInputs["domains"] . $item;
                $this->items($arInputs);
            }
        }
    }

    private function items($arInputs)
    {
        $list_img = "";
        $html = file_get_contents($arInputs["item_url"]);
        $document = phpQuery::newDocument($html);

        unset($html);

        $name_item = $document->find($arInputs["name_item"]);
        $pq = pq($name_item);
        $this->db->where('name', $pq->text());
        $query = $this->db->get('item_rev');
        $dbItem = $query->result_array();

        if(!empty($dbItem[0]["id"])){
            $arInputs["id_items"] = $dbItem[0]["id"];  
        }
        
        if(!in_array($pq->text(), $dbItem[0])) {

            unset($dbItem, $query);

            if (!empty($arInputs["link_img"]) && stristr($arInputs["link_img"], '[')) {
                $arLinkImg = explode("[", $arInputs["link_img"]);
                $arLinkImg[1] = str_replace(array("]"), "", $arLinkImg[1]);
            } elseif (!empty($arInputs["link_img"])) {
                $arLinkImg[0] = $arInputs["link_img"];
            }

            if (!empty($arInputs["link_img"]) && !empty($arInputs["img_filter"])) {
                $colors_def = $this->generator_color->getImageColor('.' . $arInputs["img_filter"], 3, 5);
            }

            if (!empty($arLinkImg[0])) {
                foreach ($document->find($arLinkImg[0]) as $cell => $link) {
                    $load_img = true;

                    $tr_name = rus2translit($arInputs["name_source"]);
                    $pq_img = pq($link);
                    $link_image = $pq_img->attr($arLinkImg[1]);

                    if (stristr($link_image, '//')) {
                        $arInputs["link_img"] = $arInputs['scheme'] . ":" . $link_image;
                    } else {
                        $arInputs["link_img"] = $arInputs['domains'] . $link_image;
                    }

                    $name_file = substr(strrchr($link_image, "/"), 1);
                    $format_file = substr(strrchr($name_file, "."), 1);
                    $arFilterImg = array('jpg', 'jpeg', 'png', 'gif');

                    if (in_array($format_file, $arFilterImg)) {
                        $colors_load = $this->generator_color->getImageColor($arInputs["link_img"], 3, 5);

                        if (!empty($colors_def)) {
                            foreach ($colors_def as $key_def => $def_color) {
                                foreach ($colors_load as $key => $color) {
                                    if ($key != "FFFFFF") {
                                        if ($key == $key_def) {
                                            $load_img = false;
                                            break;
                                        }
                                        $exe_color = strncmp($key_def, $key, 2);

                                        if ($exe_color == 0) {
                                            $load_img = false;
                                            break;
                                        }
                                    }
                                }

                                if ($load_img == false) {
                                    break;
                                }
                            }
                        }

                        $path = "./color/img/$tr_name/" . $arInputs["id_parser"];

                        if ($load_img) {
                            if (!file_exists($path)) {
                                mkdir($path, 0777, true);
                                vdgu($path);
                            }
                            $path .= "/" . $name_file;
                            file_put_contents($path, file_get_contents($arInputs["link_img"]));
                            $path = $path . "\n";
                            $list_img .= substr($path, 1);
                        }
                    }
                }
            }

            $arItem = array("id_catagory" => (int)$arInputs["id_parser"], "name" => $pq->text(), "img" => $list_img);
            $this->db->insert('item_rev', $arItem);
            $this->db->where('name', $pq->text());
            $this->db->select('id');
            $query = $this->db->get('item_rev');
            $arInputs["id_items"] = $query->result_array();

            unset($query);

            $arInputs["id_items"] = $arInputs["id_items"][0]["id"];
            //$name_product = pq($arInputs["name_item"])->text();

        } else {
            if (!empty($arInputs["link_img"]) && stristr($arInputs["link_img"], '[')) {
                $arLinkImg = explode("[", $arInputs["link_img"]);
                $arLinkImg[1] = str_replace(array("]"), "", $arLinkImg[1]);
            } elseif (!empty($arInputs["link_img"])) {
                $arLinkImg[0] = $arInputs["link_img"];
            }

            if (!empty($arInputs["link_img"]) && !empty($arInputs["img_filter"])) {
                $colors_def = $this->generator_color->getImageColor('.' . $arInputs["img_filter"], 3, 5);
            }

            if (!empty($arLinkImg[0])) {
                foreach ($document->find($arLinkImg[0]) as $cell => $link) {
                    $load_img = true;

                    $tr_name = rus2translit($arInputs["name_source"]);
                    $pq_img = pq($link);
                    $link_image = $pq_img->attr($arLinkImg[1]);

                    if (stristr($link_image, '//')) {
                        $arInputs["link_img"] = $arInputs['scheme'] . ":" . $link_image;
                    } else {
                        $arInputs["link_img"] = $arInputs['domains'] . $link_image;
                    }

                    $name_file = substr(strrchr($link_image, "/"), 1);
                    $format_file = substr(strrchr($name_file, "."), 1);
                    $arFilterImg = array('jpg', 'jpeg', 'png', 'gif');

                    if (in_array($format_file, $arFilterImg)) {
                        $colors_load = $this->generator_color->getImageColor($arInputs["link_img"], 3, 5);
                        if (!empty($colors_def)) {
                            foreach ($colors_def as $key_def => $def_color) {
                                foreach ($colors_load as $key => $color) {
                                    if ($key != "FFFFFF") {
                                        if ($key == $key_def) {
                                            $load_img = false;
                                            break;
                                        }
                                        $exe_color = strncmp($key_def, $key, 2);
                                        if ($exe_color == 0) {
                                            $load_img = false;
                                            break;
                                        }
                                    }
                                }
                                if ($load_img == false) {
                                    break;
                                }
                            }
                        }

                        $path = "./color/img/$tr_name/" . $arInputs["id_parser"];

                        if ($load_img) {
                            if (!file_exists($path)) {
                                mkdir($path, 0777, true);
                                vdgu($path);
                            }
                            $path .= "/" . $name_file;
                            file_put_contents($path, file_get_contents($arInputs["link_img"]));
                            $path = $path . "\n";
                            $list_img .= substr($path, 1);
                        }
                    }
                }
            }
            $arItem = array("name" => $pq->text(), "img" => $list_img);
            $this->db->where('id', $arInputs["id_items"]);
            $this->db->update('item_rev', $arItem);
        }

        if(!empty($arInputs["table_property"])){

            $this->db->where('id_item', $arInputs["id_items"]);
            $query = $this->db->get('property_items');
            $getProperty = $query->result_array();
            $count_property = $query->num_rows();
            vdgu($getProperty);

            foreach ($document->find($arInputs["table_property"]) as $key => $element) {
                $arProperty[$key]["name"] = pq(pq($element)->children('td')->get(0))->text();
                $arProperty[$key]["value"] = pq(pq($element)->children('td')->get(1))->text();

                foreach ($arInputs["property"] as $property){
                    if($arProperty[$key]["name"] == $property["name"]){
                        $arProperty[$key]["name"] = $property["value"];
                    }
                }
                
                $b_pars = true;
                
                foreach ($getProperty as $prop){
                    if($arProperty[$key]["name"] == $prop["name"]){
                        $b_pars = false;
                    }
                }
                

                if($count_property == 0 || $b_pars){
                    $arItem = array("id_item" => (int)$arInputs["id_items"], "name" => $arProperty[$key]["name"], "value" => $arProperty[$key]["value"]);
                    $this->db->insert('property_items', $arItem);
                }

                unset($arProperty[$key]);
            }
            
        }

        $code_item = $document->find($arInputs["code_item"]);

        if (!empty($code_item)) {
            $code_item = explode($arInputs["exceptions"], $code_item);
            $arInputs["code"] = $code_item[1];
        }

        if (!empty($arInputs["link_reviews"])) {
            $this->reviews($arInputs, 0);
        }        
    }

    private function reviews($arInputs, $count)
    {
        $this->db->where('id_items', $arInputs["id_items"]);
        $this->db->select('value');
        $query = $this->db->get("rev_table");
        $count_rev = $query->num_rows();

        unset($query);

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

            if ($count_rev>0) {
                $strAddBd = "";
                continue;
            }

            $strAddBd .= "(null, ".$arInputs["id_items"].", '$review'),";

            if ($count == 30) {
                $strAddBd = substr($strAddBd,0,-1);
                $strAddBd .= ";";
                $this->db->query("INSERT INTO rev_table (`id`, `id_items`, `value`) VALUES " . $strAddBd);
                sleep(1);
                $count = 0;
                $strAddBd = "";
            }

        }

        $page_rev = $document->find($arInputs["class_page_rev"]);
        $next_page = pq($page_rev)->next();
        $next_page = pq($next_page)->children()->attr("href");

        if (!empty($next_page)) {
            $arInputs["link_reviews"] = $next_page;
            $this->reviews($arInputs, $count);
        }

        if(!empty($strAddBd)) {
            $strAddBd = substr($strAddBd, 0, -1);
            $strAddBd .= ";";
            $this->db->query("INSERT INTO rev_table (`id`, `id_items`, `value`) VALUES " . $strAddBd);
        }
    }
}
