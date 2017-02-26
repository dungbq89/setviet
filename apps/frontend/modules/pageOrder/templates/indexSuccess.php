<div class="clearfix"></div>
<?php include_component('moduleAdvertise', 'topOne'); ?>
<div class="clearfix"></div>


<div class="content fll">
    <div class="left_pico fl">
        <?php include_component('moduleProduct', 'boxSupport'); ?>
    </div>
    <div class="right_pico fr">


        <div class="all">
            <div class="top_product2">
                Thông tin đặt hàng
            </div>
            <div class="views_sp">

                <form method="post" name="cart_form">

                    <div class="col-addcart1">

                        <div class="p-cart-info">

                            <table class="p-cart-order">
                                <tbody>
                                <tr class="bg-th">
                                    <th width="162">Ảnh</th>
                                    <th width="368">Tên</th>
                                    <th width="153">Số lượng</th>
                                    <th width="122">Giá tiền</th>
                                </tr>
                                <?php if (isset($product)) {
                                    $path = '/uploads/' . sfConfig::get('app_product_images') . $product->image_path;
                                    ?>
                                    <tr class="bg-th">
                                        <th width="162">
                                            <a href="<?php echo url_for2('product_detail', array('slug' => $product->getSlug())) ?>"
                                               title="<?php echo htmlspecialchars($product->product_name) ?>">
                                                <img
                                                    src="<?php echo VtHelper::getThumbUrl($path, 150, 185, 'default') ?>"
                                                    alt="<?php echo htmlspecialchars($product->product_name) ?>"/>
                                            </a>
                                        </th>
                                        <th width="368"><?php echo htmlspecialchars($product->getProductName()); ?></th>
                                        <th width="153">1</th>
                                        <th width="122">
                                            <?php
                                            if ($product->getPricePromotion()) {
                                                echo number_format($product->getPricePromotion(), 0, ",", ".") . ' VNĐ';
                                            } else {
                                                echo number_format($product->getPrice(), 0, ",", ".") . ' VNĐ';
                                            }
                                            ?>
                                        </th>
                                    </tr>
                                <?php } ?>

                                </tbody>
                            </table>
                        </div>
                        <h4>Thông tin người mua hàng</h4>

                        <div class="p-cart-info" style="margin-top: 20px;">
                            <?php echo $form->renderHiddenFields() ?>
                            <div class="frm-item">
                                <span class="label">Họ và tên &nbsp;</span>
                                <span class="btn-in">
                                     <?php echo $form['customer_name']->render(array('class' => 'in-txt'));
                                     if ($form['customer_name']->hasError()) {
                                         echo '<span class="help-inline">' . $form['customer_name']->renderError() . '</span>';
                                     } ?>
                                </span>
                            </div>
                            <div class="frm-item">
                                <span class="label">Điện thoại</span>
                                <span class="btn-in">
                                     <?php echo $form['customer_phone']->render(array('class' => 'in-txt'));
                                     if ($form['customer_phone']->hasError()) {
                                         echo '<span class="help-inline">' . $form['customer_phone']->renderError() . '</span>';
                                     } ?>
                                </span>
                            </div>
                            <div class="frm-item">
                                <span class="label">Địa chỉ &nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span class="btn-in">
                                     <?php echo $form['customer_address']->render(array('class' => 'in-txt'));
                                     if ($form['customer_address']->hasError()) {
                                         echo '<span class="help-inline">' . $form['customer_address']->renderError() . '</span>';
                                     } ?>
                                </span>
                            </div>
                            <div class="frm-item">
                                <span class="label">Nội dung &nbsp;</span>
                                <span class="btn-in">
                                     <?php echo $form['body']->render(array('class' => 'in-txt-body'));
                                     if ($form['body']->hasError()) {
                                         echo '<span class="help-inline">' . $form['body']->renderError() . '</span>';
                                     } ?>
                                </span>
                            </div>

                            <div class="frm-item">
                                <span class="label">Mã bảo mật* </span>

                                <?php echo $form['captcha']->render(array('class' => 'span2', 'style' => 'width:90px'));
                                if ($form['captcha']->hasError()) {
                                    echo '<span class="help-inline">' . $form['captcha']->renderError() . '</span>';
                                }
                                ?>

                            </div>

                            <div class="frm-item">
                                <span class="label"></span>
                                <span class="btn-in" style="color: green;">
                                    <?php if ($sf_user->hasFlash('success')): ?>
                                        <span><?php echo __($sf_user->getFlash('success'), null, 'tmcTwitterBootstrapPlugin') ?></span>
                                    <?php endif; ?>
                                </span>
                            </div>
                            <div class="box-btn">
                                <button name="" type="submit" class="btn-order">Đặt hàng</button>
                            </div>

                        </div>

                    </div>

                </form>
            </div>
        </div>

    </div>
</div>
<style>
    .slide {
        margin-top: 3px !important;
    }
    .label{
        width: 100px;
    }
    .frm-item{
        margin-bottom: 15px;
    }
    .in-txt{
        width: 220px;
        padding: 3px;
    }
    .btn-order{
        cursor: pointer;
        padding: 3px 5px;
        font-weight: bold;
    }
    .in-txt-body{
        width: 350px;
    }
    .error_list li{
        color: red;
    }
</style>