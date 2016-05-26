<?php

/**
 * Created by PhpStorm.
 * User: ciel
 * Date: 26.05.16
 * Time: 23:43
 */
class Phpmorph
{
    private $dir = './public/phpmorphy/dicts';
    private $lang = 'ru_RU';
    private $opts = array(
        'storage' => PHPMORPHY_STORAGE_FILE,
    );

public function __construct()
{
    require_once( './public/phpmorphy/phpmorphy-0.3.7/src/common.php');

}
    public function morph($val, $property){
        require_once( './public/phpmorphy/phpmorphy-0.3.7/src/common.php');
        $dir = './public/phpmorphy/dicts';
        $lang = 'ru_RU';
        $opts = array(
            'storage' => PHPMORPHY_STORAGE_FILE,
        );
        try {
            $morphy = new phpMorphy($dir, $lang, $opts);
        } catch(phpMorphy_Exception $e) {
            die('Error occured while creating phpMorphy instance: ' . $e->getMessage());
        }
        $val = mb_strtoupper($val);
        $val = explode(" ", $val);
        foreach ($val as $row){
            $ar_morph = $morphy->castFormByGramInfo($row, null, $property, true);
            if($ar_morph[0] !=false){
                $callback[] = $ar_morph[0];
            } else {
                $callback[] = $row;
            }
        }
        $callback = implode(" ", $callback);
        $callback = mb_strtolower($callback);
        return $callback;
    }
}