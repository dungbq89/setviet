<?php
/**
 * Created by PhpStorm.
 * User: Ta Van Ngoc
 * Date: 7/28/15
 * Time: 11:34 PM
 */

?>
<div class="main">
    <div class="col-main">
        <div class="box">
            <h3 class="title-main"><span class="label">Đăng ký hội viên &raquo</span></h3>
           <div class="box-form-contact">

                <form class="frm-contact" action="" method="POST">
                    <?php echo $form->renderHiddenFields() ?>
                    <div class="frm-item">
                        <span class="label">Họ tên (*)</span>
                        <span class="btn-in">
                             <?php echo $form['customer_name']->render(array('class'=>'in-txt'));
                             if ($form['customer_name']->hasError()) {
                                 echo '<span class="help-inline">' . $form['customer_name']->renderError() . '</span>';
                             }?>
                        </span>
                    </div>


                    <div class="frm-item">
                        <span class="label">Địa chỉ (*)</span>
                        <span class="btn-in">
                             <?php echo $form['customer_address']->render(array('class'=>'in-txt'));
                             if ($form['customer_address']->hasError()) {
                                 echo '<span class="help-inline">' . $form['customer_address']->renderError() . '</span>';
                             }?>
                        </span>
                    </div>


                    <div class="frm-item">
                        <span class="label"></span>
                        <span class="btn-in">
                            <?php if ($sf_user->hasFlash('success')): ?>
                                <span><?php echo __($sf_user->getFlash('success'), null, 'tmcTwitterBootstrapPlugin') ?></span>
                            <?php endif; ?>
                        </span>
                    </div>
                    <div class="box-btn">
                        <button name="" type="submit" class="btn">Gửi đăng ký</button>
                    </div>

                </form>
            </div>

        </div>
    </div>

    <div class="clear"></div>
</div>

