<?php

/**
 * VtpProductsCategoryTable
 *
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class VtpProductsCategoryTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object VtpProductsCategoryTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('VtpProductsCategory');
    }

    /*Backend*/
    public static function getListCategoryByPortal($portalId)
    {
        $sql = VtpProductsCategoryTable::getInstance()->createQuery('a')
            ->andWhere('a.portal_id=?',$portalId)
            ->andWhere('a.lang=?',sfContext::getInstance()->getUser()->getCulture())
            ->orderBy('a.priority asc');
        return $sql->execute();
    }

    public static function getListProductCategory()
    {
        $sql = VtpProductsCategoryTable::getInstance()->createQuery('a')
            ->select('name, image_path, description, link')
            ->andWhere('a.is_active=1')
            ->andWhere('a.lang=?',sfContext::getInstance()->getUser()->getCulture())
            ->orderBy('a.priority asc');
        return $sql;
    }

    public static function checkSlug($slug, $id)
    {
        $query = VtpProductsCategoryTable::getInstance()->createQuery()
            ->select('slug')
            ->where('slug=?', $slug)
            ->andWhere('id<>?', $id);
        return $query;
    }

    public static function getListProductCategoryAll()
    {
        return self::getListProductCategory()
            ->innerJoin('a.ProductCategory p')
            ->limit(8)
            ->execute();
    }

    // ngoctv: lay danhL sach categoey trang chu
    public static function getListCategoryHome($portalId)
    {
        $sql = VtpProductsCategoryTable::getInstance()->createQuery()
            ->select('name, image_path, link, priority, description, slug')
            ->andWhere('is_active=1')
            ->andWhere('lang=?',sfContext::getInstance()->getUser()->getCulture())
            ->orderBy('priority asc');
        return $sql->fetchArray();
    }


    public static function getCategoryProductBySlug($slug)
    {
        $sql = VtpProductsCategoryTable::getInstance()->createQuery('a')
            ->select('name, image_path, description, meta, keywords')
            ->where('a.is_active=1')
            ->andWhere('a.slug=?',$slug)
            ->andWhere('a.lang=?',sfContext::getInstance()->getUser()->getCulture())
            ->orderBy('a.priority asc');
        return $sql->fetchOne();
    }

    public static function getCategoryByParentID($parentId, $limit=null)
    {
        $query = VtpProductsCategoryTable::getInstance()->createQuery()
            ->where(($parentId != '') ? 'parent_id=?' : '(parent_id=? or parent_id is null)', $parentId)
            ->andWhere('is_active=1')
            ->orderby('priority asc');
        if($limit!=null){
            $query->limit($limit);
        }
        return $query->execute();
    }

    public static function getCategoryById($id)
    {
        $query = VtpProductsCategoryTable::getInstance()->createQuery()
            ->select('level,name')
            ->Where('id=?', $id);
        return $query->fetchOne();
    }

    public static function getCategoryByType($listChild)
    {
        $query = VtpProductsCategoryTable::getInstance()->createQuery()
            ->select('name, parent_id, level, priority')

            ->andWhere('lang=?', sfContext::getInstance()->getUser()->getCulture());
           // ->orderby('priority asc');
        if ($listChild != '') {
            $query->andWhereNotIn('id', explode(',', $listChild));
        }
        $arrCat = $query->execute();
        $arrResult = array();
        $i18n = sfContext::getInstance()->getI18N();
        $arrResult[''] = $i18n->__('---Chọn chuyên mục---');
        foreach ($arrCat as $cat) {
            $strTab = '';
//            if ($cat->level > 0) {
//                for ($i = 0; $i < $cat->level; $i++) {
//                    $strTab = $strTab . '...';
//                }
//            }
            $arrResult[$cat->id] = $strTab . $cat->name;
        }

        return $arrResult;
    }

    public static function getCategoryByLevel($level, $limit=null){
        $sql = VtpProductsCategoryTable::getInstance()->createQuery('a')
            ->where('a.level=?',$level)
            ->andWhere('a.is_active=?',VtCommonEnum::NUMBER_ONE)
            ->orderBy('a.priority asc');
        if($limit){
            $sql->limit($limit);
        }
        return $sql;
    }
    //lay danh sach chuyen muc san pham trang chu
    public static function getProductCategoryHome($parentId, $limit)
    {
        $sql = VtpProductsCategoryTable::getInstance()->createQuery()
            ->select('*')
            ->andWhere('is_active=1')
            ->andWhere('is_home=1')
            ->andWhere(($parentId != '') ? 'parent_id=?' : '(parent_id=? or parent_id is null)', $parentId)
            ->orderBy('priority asc')
            ->limit($limit);
        return $sql;
    }

    // lay toan bo id theo cha
    public static function getStrCategoryByParent($category_id)
    {
        $strCat = $category_id;
        $lstCat = self::getCategoryByParentID($category_id);
        if (count($lstCat) > 0) {
            foreach ($lstCat as $item) {
                $strCat .= ',' . $item->id;
            }
        }
        if (VtHelper::endsWith($strCat, ',')) {
            $strCat = substr($strCat, 0, strlen($strCat) - 1);
        }
        return $strCat;
    }
}