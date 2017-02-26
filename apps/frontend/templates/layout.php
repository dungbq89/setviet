<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>

    <meta property="og:type" content="article">
    <meta name="revisit" content="1 days"/>
    <meta name="robots" content="index,follow"/>
    <meta name="googlebot" content="index,follow"/>
    <meta name="language" content="vi-VN"/>
    <meta name="geo.country" content="VN"/>
    <meta name="geo.region" content="VN-HN"/>
    <meta name="geo.placename" content="Hà Nội"/>
    <meta name="geo.position" content="21.033333;105.85"/>
    <meta name="dc.publisher" content="vinhthanhsat.com"/>
    <meta name="dc.identifier" content="vinhthanhsat.com"/>
    <meta name="dc.language" content="vi-VN"/>
</head>

<body id="body">


<div class="wapper">
    <?php include_component('moduleMenu', 'header') ?>


    <div class="menu">
        <ul class="ls menu-hori fl">
            <li class="menu-pc"><a href="javascript:void(0)" class="menu-pc-title" rel="nofollow">Danh mục sản phẩm</a>
                <?php include_component('moduleProduct', 'productMenu') ?>

            </li>
            <?php include_component('moduleMenu', 'mainMenu') ?>
        </ul>
        <ul class="ls menu-right">
            <li>Hotline: <span>0973.158.129</span>

            </li>
        </ul>
    </div>

    <?php echo $sf_content;?>

    <?php include_component('moduleMenu', 'contentFooter'); ?>
    <div class="hotline" style="position: fixed; bottom: 20px; right: 5px;">
        <img src="/images/hotline.png" width="200px" />
    </div>
</div>


</body>
<script type="text/javascript">


</script>
</html>
