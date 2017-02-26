

<?php
if (count($advertise) > 0) {
    $advertiseImage = $advertise[0]['AdvertiseImage'];
    $count = count($advertiseImage);
    if ($count > 0) { ?>

        <div class="quangcao_2 all">
                <a href="<?php if ($advertiseImage[0]['link']) echo $advertiseImage[0]['link']; ?>">
                    <img width="1200" height="100" src="<?php echo sfConfig::get('app_url_media_file') . '/' . sfConfig::get('app_advertise_images') . $advertiseImage[0]['file_path']; ?>">
                </a>
            <?php
            }
            ?>

        </div>
<?php } ?>