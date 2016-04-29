<?php
echo "<h1>Hello</h1>";
print_r($base_url);

echo "<pre>"
?>
<ul>
<?php foreach ($query as $key=>$item):?>
    <li><?php echo $key.": ".$item->username;?></li>
<?php endforeach;?>
</ul>
<?php
echo "nit";
?>
<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
