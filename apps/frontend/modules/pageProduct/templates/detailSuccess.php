<div class="clearfix"></div>
<?php include_component('moduleAdvertise', 'topOne'); ?>
<div class="clearfix"></div>


<div class="content fll">
    <div class="left_pico fl">
        <?php include_component('moduleProduct','boxSupport'); ?>
    </div>
    <div class="right_pico fr">


        <div class="all">
            <div class="top_product2">
                <div id="it"><?php echo htmlspecialchars($product->getProductName()) ?></div>
            </div>

            <div class="views_sp views_sp03">
                <?php
                $path = '/uploads/' . sfConfig::get('app_product_images') . $product->getImagePath();
                ?>
                <div class="chitiet_left fl">
                    <div class="anh_tin">
                        <img alt="<?php echo htmlspecialchars($product->getProductName()) ?>"
                             src="<?php echo VtHelper::getThumbUrl($path, 400, 300) ?>"
                             alt="<?php echo htmlspecialchars($product->getProductName()) ?>"
                             width="400" title="<?php echo htmlspecialchars($product->getProductName()) ?>"
                             itemprop="image" id="main-product-img-123"/>
                    </div>

                </div>
                <div class="chitiet_right fr">
                    <h1 itemprop="name" class="fn"><a href="#"
                                                      itemprop="url"><?php echo htmlspecialchars($product->getProductName()) ?></a>
                    </h1>

                    <div itemprop="offers">
                        <meta itemprop="priceCurrency" content="VND"/>

                        <?php
                        if ($product->getPricePromotion() && $product->getPricePromotion() != 0) {
                            if ($product->getPrice() && $product->getPrice() != 0) {
                                ?>
                                <div class="giachinhhang">Giá bán: <span><?php
                                        if ($product->getPrice()) {
                                            echo number_format($product->getPrice(), 0, ",", ".") . ' VNĐ';
                                        } ?></span></div>

                                <div class="giaKM">Giá khuyến mại: <span itemprop="price"><?php
                                        echo number_format($product->getPricePromotion(), 0, ",", ".") . ' VNĐ';
                                        ?>
                                    </span></div>
                            <?php
                            } else {
                                ?>
                                <div class="giaKM">Giá khuyến mại: <span itemprop="price"><?php
                                        if ($product->getPricePromotion()) {
                                            echo number_format($product->getPricePromotion(), 0, ",", ".") . ' VNĐ';
                                        } else {
                                            echo 'Liên hệ';
                                        }
                                        ?>
                                    </span></div>
                            <?php
                            }
                        } else {
                            ?>
                            <div class="giachinhhang">Giá bán: <span><?php
                                    if ($product->getPrice()) {
                                        echo number_format($product->getPrice(), 0, ",", ".") . ' VNĐ';
                                    } else {
                                        echo 'Liên hệ';
                                    }
                                    ?>
                                    </span></div>
                        <?php
                        }
                        ?>

                    </div>
                    <div>
                        <p class="buy all">
                            <a href="<?php echo url_for2('order_product',array('id'=>$product->id)) ?>" ><img src="/Content/skins/images/buy.png"></a>
                        </p>
                    </div>
                    <div itemprop="description" class="list_thongso all">
                        <?php echo nl2br($product->getDescription()); ?>
                    </div>

                    <p class="mienphis fl">
                </div>
                <div class="clearfix"></div>
                <div class="thogntin_sanpham all">
                    <ul class="list_thongtin">
                        <li><a href="javascript:;" id="tab-1"
                               onclick="changeTab('1', 'div-', 'tab-', '2', '', 'active'); return false;"
                               rel="nofollow">Chi tiết sản phẩm</a></li>

                    </ul>
                    <div class="chitiet_sp" id="div-1">

                        <?php echo $product->getContent(); ?>

                    </div>

                </div>

            </div>
            <?php if (isset($products) && count($products)) { ?>
                <div class="top_product2">
                    <div id="it">Sản phẩm cùng chuyên mục</div>
                </div>

                <div class="views_sp views_sp02">
                    <ul class="list-item">
                        <?php
                        foreach ($products as $pro) {
                            $path = '/uploads/' . sfConfig::get('app_product_images') . $pro['image_path'];
                            $percent = 0;
                            if ($pro['price_promotion'] && $pro['price_promotion'] != 0) {
                            if ($pro['price'] && $pro['price'] != 0) {
                            $subPer = intval($pro['price']) - intval($pro['price_promotion']);
                            $percent = round(($subPer / $pro['price']) * 100);
                            }
                            }
                            ?>
                            <li>
                                <div class="bos_sp2">
                                    <a href="<?php echo url_for2('product_detail', array('slug' => $pro['slug'])) ?>"
                                       title="<?php echo htmlspecialchars($pro['product_name']) ?>">
                                        <img src="<?php echo VtHelper::getThumbUrl($path, 150, 185, 'default') ?>"
                                             alt="<?php echo htmlspecialchars($pro['product_name']) ?>"/>
                                    </a>
                                </div>

                                <?php if ($percent > 0): ?>
                                    <p class="type-discount">-<?php echo $percent; ?>%</p>
                                <?php endif; ?>


                                <span class="product-name"><a
                                        href="<?php echo url_for2('product_detail', array('slug' => $pro['slug'])) ?>"
                                        title="<?php echo htmlspecialchars($pro['product_name']) ?>"><?php echo htmlspecialchars($pro['product_name']) ?></a></span>

                                <?php
                                if ($pro['price_promotion'] && $pro['price_promotion'] != 0) {
                                    if ($pro['price'] && $pro['price'] != 0) {
                                        ?>
                                        <span class="product-pricesave"><?php
                                            if ($pro['price']) {
                                                echo number_format($pro['price'], 0, ",", ".") . ' VNĐ';
                                            } ?></span>

                                        <span class="product-name2"><?php
                                            echo number_format($pro['price_promotion'], 0, ",", ".") . ' VNĐ';
                                            ?>
                                    </span>
                                    <?php
                                    } else {
                                        ?>
                                        <span class="product-name2"><?php
                                            if ($pro['price_promotion']) {
                                                echo number_format($pro['price_promotion'], 0, ",", ".") . ' VNĐ';
                                            } else {
                                                echo 'Liên hệ';
                                            }
                                            ?>
                                    </span>
                                    <?php
                                    }
                                } else {
                                    ?>
                                    <span class="product-name2"><?php
                                        if ($pro['price']) {
                                            echo number_format($pro['price'], 0, ",", ".") . ' VNĐ';
                                        } else {
                                            echo 'Liên hệ';
                                        }
                                        ?>
                                    </span>
                                <?php
                                }
                                ?>

                                <span>
                    </span>
                                </p>
                            </li>
                        <?php } ?>
                        <div class="clearfix"></div>

                    </ul>
                    <div class="clearfix"></div>
                </div>
            <?php } ?>
        </div>

    </div>
</div>
<style>
    .slide {
        margin-top: 3px !important;
    }
</style>