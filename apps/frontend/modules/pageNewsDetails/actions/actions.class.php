<?php

/**
 * pageNewsDetails actions.
 *
 * @package    Vt_Portals
 * @subpackage pageNewsDetails
 * @author     ngoctv1
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class pageNewsDetailsActions extends sfActions
{
    public function executeIndex(sfWebRequest $request)
    {
        //lay thong tin chi tiet bai viet
        $articleId=0;
        $slug = $request->getParameter('slug');
        if($slug){
            $article = AdArticleTable::getArticleBySlug($slug);
            if($article){
                $this->category = $category = AdCategoryTable::getCategoryById($article['category_id']);
                $articleId=$article['id'];

                if (($article['attributes'] & 8))
                    $this->newsCopyright=true;
                $this->article = $article;
                $this->articleRelated = AdArticleTable::getListArticleRelated($article['id']);
                $this->articleOther=AdArticleTable::getListArticle($article['category_id'],4,$articleId)->fetchArray();
                AdArticleTable::updateHitCounter($article['id']);
            }
            else{
                return $this->redirect404();
            }

        }
        else{
            return $this->redirect404();
        }
        //Khai bao form comment
        $form=new ArticlesCommentForm();
        if($request->isMethod('POST')){
            $values = $request->getParameter($form->getName());
            $form->bind($values);
            if($form->isValid()){
                $comment=new AdArticlesComment();
                $comment->setArticleId($articleId);
                $comment->setFullName(trim($values['fullname']));
                $comment->setEmail(trim($values['email']));
                $comment->setContent(trim($values['content']));
                $comment->save();
                $this->getUser()->setFlash('success','Cảm ơn bạn đã góp ý cho bài viết. Trân trọng!');
            }
        }
        $this->form=$form;
    }

}
