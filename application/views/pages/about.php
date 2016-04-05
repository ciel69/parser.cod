<?php
echo "<h1>Hello</h1>";
print_r($base_url);
?>
<ul>
<?php foreach ($query[0] as $key=>$item):?>
    <li><?php echo $key.": ".$item;?></li>
<?php endforeach;?>
</ul>
<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
