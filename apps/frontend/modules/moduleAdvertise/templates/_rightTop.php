

<?php
if (count($advertise) > 0) {
    $advertiseImage = $advertise[0]['AdvertiseImage'];
    $count = count($advertiseImage);
    if ($count > 0) { ?>
        <div id="ad_right1_300" class="oad" style="display: block;">
            <a target="_blank" href="<?php if ($advertiseImage[0]['link']) echo $advertiseImage[0]['link']; ?>">
                <img width="300px" height="240px" alt="" src="<?php echo sfConfig::get('app_url_media_file') . '/' . sfConfig::get('app_advertise_images') . $advertiseImage[0]['file_path']; ?>">
            </a>
        </div>
<?php } }else{ ?>

<?php } ?>