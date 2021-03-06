<div class="clearfix"></div>
<?php include_component('moduleAdvertise', 'topOne'); ?>
<div class="clearfix"></div>


<div class="content fll">
    <div class="left_pico fl">


        <div class="loctim2">
            <h2><a href="/tu-van.html" title="Tư vấn">Tư vấn</a></h2>

            <div class="box_bottom">
                <ul class="list-tin-doc-nhieu">

                    <li>

                        <p class="nhanvien">Ms Luyên:<span> 0983.403.091</span></p>

                        <p class="nhanvien"></p>

                        <p class="nhanvien">Mr Dũng :<span> 0973.158.129</span></p>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <div class="right_pico fr">


        <div class="all">
            <div class="top_product2">
                <div id="it" style="width: 100%;">Kết quả tìm kiếm cho: <?php echo htmlspecialchars($queryName); ?></div>
            </div>

            <div class="views_sp views_sp02">
                <?php if (isset($listProduct)): ?>
                    <ul class="list-item">
                        <?php
                        $count = 1;
                        foreach ($listProduct as $product):
                            $path = '/uploads/' . sfConfig::get('app_product_images') . $product['image_path'];
                            $percent = 0;
                            if ($product['price_promotion'] && $product['price_promotion'] != 0) {
                                if ($product['price'] && $product['price'] != 0) {
                                    $subPer = intval($product['price']) - intval($product['price_promotion']);
                                    $percent = round(($subPer / $product['price']) * 100);
                                }
                            }
                            ?>
                            <li>
                                <div class="bos_sp2">
                                    <a href="<?php echo url_for2('product_detail', array('slug' => $product->getSlug())) ?>"
                                       title="<?php echo htmlspecialchars($product->product_name) ?>">
                                        <img src="<?php echo VtHelper::getThumbUrl($path, 150, 185, 'default') ?>"
                                             alt="<?php echo htmlspecialchars($product->product_name) ?>"/>
                                    </a>
                                </div>

                                <?php if ($percent > 0): ?>
                                    <p class="type-discount">-<?php echo $percent; ?>%</p>
                                <?php endif; ?>


                                <span class="product-name"><a
                                        href="<?php echo url_for2('product_detail', array('slug' => $product->getSlug())) ?>"
                                        title="<?php echo htmlspecialchars($product->product_name) ?>"><?php echo htmlspecialchars($product->product_name) ?></a></span>

                                <?php
                                if ($product['price_promotion'] && $product['price_promotion'] != 0) {
                                    if ($product['price'] && $product['price'] != 0) {
                                        ?>
                                        <span class="product-pricesave"><?php
                                            if ($product['price']) {
                                                echo number_format($product['price'], 0, ",", ".") . ' VNĐ';
                                            } ?></span>

                                        <span class="product-name2"><?php
                                            echo number_format($product['price_promotion'], 0, ",", ".") . ' VNĐ';
                                            ?>
                                    </span>
                                    <?php
                                    } else {
                                        ?>
                                        <span class="product-name2"><?php
                                            if ($product['price_promotion']) {
                                                echo number_format($product['price_promotion'], 0, ",", ".") . ' VNĐ';
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
                                        if ($product['price']) {
                                            echo number_format($product['price'], 0, ",", ".") . ' VNĐ';
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
                        <?php
                        if($count%4==0){
                            ?>
                            <div class="clearfix"></div>
                            <?php
                        }
                        $count++;
                        endforeach;
                        ?>


                    </ul>
                <?php endif; ?>
                <div class="clearfix"></div>
            </div>
            <?php
            if ($pager->haveToPaginate()) {
                include_component("common", "pagging", array('redirectUrl' => $url_paging, 'pager' => $pager, 'vtParams' => array('keyword' => $keyword)));
            }
            ?>
        </div>

    </div>
</div>
<style>
    .slide {
        margin-top: 3px !important;
    }
</style>