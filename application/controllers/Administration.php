<?php

class Administration extends CI_Controller
{

    public function parser($settings = 'index', $pars = "")
    {
        $this->load->helper('translit');
        $this->load->helper('request_url');
        $this->load->helper('formation_helper');
        $this->load->library('ion_auth');
        if (!$this->ion_auth->logged_in()) {
            redirect('/auth/login/', 'refresh');
        } elseif (!$this->ion_auth->is_admin()) {
            return show_error('You must be an administrator to view this page.');
        }
        $this->load->view('templates/header');
        $this->load->model('parser_list');
        if ($settings == 'add') {
            $this->load->view('administration/parser');
        } elseif ($settings == 'index') {
            $data["list_source"] = $this->parser_list->get_list_source();
            $this->load->view('administration/new_parser', $data);
        } elseif (!empty($pars)) {
            if ($pars == "add") {
//todo написать функцию получения св-в последнего парсера данного источника
            } else {
                $data["item_parser"] = $this->parser_list->select_pars($pars);
                $property_def = $this->parser_list->get_default_property();
                $newItem = array();
                $DefItem = array();
                $arDefItem = array();

                foreach ($property_def as $key => $arItem) {
                    if (!empty($arItem["class_property"])) {
                        $DefItem[$arItem["class_property"]] = $arItem;
                    }
                }
                foreach ($data["item_parser"] as $key => $arItemObjects) {
                    if ($key == "name_parser") {
                        $arParams[$key] = $arItemObjects[0];
                        continue;
                    }
                    if ($key == "name_source") {
                        $arParams[$key] = $arItemObjects[0];
                        continue;
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
                $data["newDefItem"] = $newDefItem;
                $this->load->view('administration/parser', $data);
            }
        } else {
            $data["list_parser"] = $this->parser_list->get_list_parser($settings);
            $this->load->view('administration/new_parser', $data);
        }
        $this->load->view('templates/footer');
        /*
         * comments test
         */
    }

}