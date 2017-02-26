<div class="col-main">
    <div class="news-detail">
        <div class="btip">
            <?php if(isset($category) && $category) ?>
            <p class="cate"><a href="<?php echo url_for2('category_news', array('slug' => $category->getSlug())) ?>" title="<?php echo htmlspecialchars($category->name); ?>"><?php echo htmlspecialchars($category->name); ?></a></p>
            <time
                class="stime"><?php if ($article['published_time']) echo date('H:i',strtotime($article['updated_at'])). ' '. VtHelper::getFormatDate($article['published_time']); ?></time>
        </div>
        <h3 class="title-article"><?php  echo htmlspecialchars($article['title']); ?></h3>
        <span class="txt-artice-intro">
            <?php echo (isset($newsCopyright) && $newsCopyright)?'<b><i>(hoinhabaohatinh.org.vn) - </i></b>':''; echo htmlspecialchars($article['header']); ?>
        </span>
        <div class="cover-detail">
            <div class="detail-body">
                <?php echo $article['body']; ?>
                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                <p class="pAuthor"><?php  echo htmlspecialchars($article['author']); ?></p>
                <div class="clear"></div>
                <div class="addthis_native_toolbox"></div>
            </div>
            <div class="detail-mostview">
                <?php include_component('moduleArticle','mostViewNews',array('limit'=>5)); ?>
            </div>
        </div>


        <?php
        if (isset($articleRelated) && count($articleRelated)):
            ?>
            <div class="box-article-more">
                <h3 class="h3-more">Bài viết cùng chuyên mục</h3>
                <?php
                foreach ($articleRelated as $value):
                    ?>
                    <a href="<?php echo url_for2('article_detail', array('slug' => $value['slug'])) ?>"
                       title="<?php echo htmlspecialchars($value['title']); ?>">
                        <?php echo htmlspecialchars($value['title']); ?>
                    </a>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
        <div class="clear"></div>
        <div class="commentTitle">
            <h3>BÌNH LUẬN</h3>
        </div>
    </div>

    <div class="comment-form">

        <form class="frm-log" action="" method="POST">
            <?php echo $form->renderHiddenFields() ?>

            <div class="frm-item">
                <span class="label">Họ tên (*)</span>
                        <span class="btn-in">
                             <?php echo $form['fullname']->render(array('class' => 'in-txt'));
                             if ($form['fullname']->hasError()) {
                                 echo '<span class="help-inline">' . $form['fullname']->renderError() . '</span>';
                             } ?>
                        </span>
            </div>


            <div class="frm-item">
                <span class="label">Email (*)</span>
                        <span class="btn-in">
                             <?php echo $form['email']->render(array('class' => 'in-txt'));
                             if ($form['email']->hasError()) {
                                 echo '<span class="help-inline">' . $form['email']->renderError() . '</span>';
                             } ?>
                        </span>
            </div>

            <div class="frm-item">
                <span class="label">Nội dung (*)</span>
                        <span class="btn-in">
                             <?php echo $form['content']->render(array('class' => 'in-txt'));
                             if ($form['content']->hasError()) {
                                 echo '<span class="help-inline">' . $form['content']->renderError() . '</span>';
                             } ?>
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
                <button name="" type="submit" class="btn">Gửi bình luận</button>
            </div>

        </form>
    </div>
    <?php
    if (isset($articleOther) && count($articleOther)):
        ?>

        <div class="sct recommendation" id="dothor2">
            <div class="hed"><div class="hgroup"><h1><a href="#">CÁC TIN ĐÃ ĐƯA</a></h1></div></div>
            <?php
            foreach ($articleOther as $value):
                $path = '/uploads/' . sfConfig::get('app_article_images') . $value['image_path'];
                $path = VtHelper::getThumbUrl($path, 460, 268, '');
                ?>
                <div class="atc">
                    <div style="background-image: url('<?php echo $path; ?>'); background-size: cover;" class="cover">
                        <a href="<?php echo url_for2('article_detail', array('slug' => $value['slug'])) ?>"
                           title="<?php echo htmlspecialchars($value['title']); ?>"></a>
                    </div>
                    <div class="hed">
                        <h1><a href="<?php echo url_for2('article_detail', array('slug' => $value['slug'])) ?>">
                                <?php echo VtHelper::truncate($value['title'], 50, '...'); ?>
                            </a></h1>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>

    <?php endif; ?>
</div>
<!--            tin anh-->
<div class="sct sidebar" id="right1" style="margin-top: 35px;">
    <?php include_component('moduleArticle','newsImages',array('limit'=>5,'att'=>2)) ?>
</div>
<div class="col-right">
    <?php include_component('moduleVideo','listVideoHome',array('limit'=>5,'width'=>'305')) ?>
    <?php include_component('moduleArticle','readNews',array('limit'=>5)) ?>
    <?php include_component('moduleMenu', 'linkRight') ?>
    <?php include_component('moduleDocument', 'hotDocument', array('limit' => 3)) ?>
    <?php include_component('moduleArticle', 'categoryHot', array('limit' => 3)) ?>
    <?php include_component('moduleAdvertise', 'advertise', array('location' => 'right')); ?>

</div>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-537227b70ef6e827" async="async"></script>
