<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('AdNews', 'doctrine');

/**
 * BaseAdNews
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $title
 * @property string $alttitle
 * @property clob $header
 * @property clob $body
 * @property string $image_path
 * @property integer $attributes
 * @property integer $priority
 * @property timestamp $published_time
 * @property timestamp $expiredate_time
 * @property string $meta
 * @property string $keywords
 * @property string $author
 * @property integer $is_active
 * @property boolean $is_hot
 * @property string $lang
 * @property string $slug
 * @property integer $category_id
 * 
 * @method string    getTitle()           Returns the current record's "title" value
 * @method string    getAlttitle()        Returns the current record's "alttitle" value
 * @method clob      getHeader()          Returns the current record's "header" value
 * @method clob      getBody()            Returns the current record's "body" value
 * @method string    getImagePath()       Returns the current record's "image_path" value
 * @method integer   getAttributes()      Returns the current record's "attributes" value
 * @method integer   getPriority()        Returns the current record's "priority" value
 * @method timestamp getPublishedTime()   Returns the current record's "published_time" value
 * @method timestamp getExpiredateTime()  Returns the current record's "expiredate_time" value
 * @method string    getMeta()            Returns the current record's "meta" value
 * @method string    getKeywords()        Returns the current record's "keywords" value
 * @method string    getAuthor()          Returns the current record's "author" value
 * @method integer   getIsActive()        Returns the current record's "is_active" value
 * @method boolean   getIsHot()           Returns the current record's "is_hot" value
 * @method string    getLang()            Returns the current record's "lang" value
 * @method string    getSlug()            Returns the current record's "slug" value
 * @method integer   getCategoryId()      Returns the current record's "category_id" value
 * @method AdNews    setTitle()           Sets the current record's "title" value
 * @method AdNews    setAlttitle()        Sets the current record's "alttitle" value
 * @method AdNews    setHeader()          Sets the current record's "header" value
 * @method AdNews    setBody()            Sets the current record's "body" value
 * @method AdNews    setImagePath()       Sets the current record's "image_path" value
 * @method AdNews    setAttributes()      Sets the current record's "attributes" value
 * @method AdNews    setPriority()        Sets the current record's "priority" value
 * @method AdNews    setPublishedTime()   Sets the current record's "published_time" value
 * @method AdNews    setExpiredateTime()  Sets the current record's "expiredate_time" value
 * @method AdNews    setMeta()            Sets the current record's "meta" value
 * @method AdNews    setKeywords()        Sets the current record's "keywords" value
 * @method AdNews    setAuthor()          Sets the current record's "author" value
 * @method AdNews    setIsActive()        Sets the current record's "is_active" value
 * @method AdNews    setIsHot()           Sets the current record's "is_hot" value
 * @method AdNews    setLang()            Sets the current record's "lang" value
 * @method AdNews    setSlug()            Sets the current record's "slug" value
 * @method AdNews    setCategoryId()      Sets the current record's "category_id" value
 * 
 * @package    Web_Portals
 * @subpackage model
 * @author     ngoctv1
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseAdNews extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('ad_news');
        $this->hasColumn('title', 'string', 512, array(
             'type' => 'string',
             'notnull' => true,
             'comment' => 'Tiêu đề bài viết',
             'length' => 512,
             ));
        $this->hasColumn('alttitle', 'string', 255, array(
             'type' => 'string',
             'comment' => 'Tiêu đề rút gọn',
             'length' => 255,
             ));
        $this->hasColumn('header', 'clob', null, array(
             'type' => 'clob',
             'comment' => 'Trích yếu',
             ));
        $this->hasColumn('body', 'clob', null, array(
             'type' => 'clob',
             'comment' => 'Nội dung bài viết trên web',
             ));
        $this->hasColumn('image_path', 'string', 255, array(
             'type' => 'string',
             'comment' => 'Đường dẫn ảnh đại diện',
             'length' => 255,
             ));
        $this->hasColumn('attributes', 'integer', 8, array(
             'type' => 'integer',
             'comment' => 'Thuộc tính của bài viết: khuyến mại, ',
             'length' => 8,
             ));
        $this->hasColumn('priority', 'integer', 5, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'Độ ưu tiên hiển thị',
             'length' => 5,
             ));
        $this->hasColumn('published_time', 'timestamp', 25, array(
             'type' => 'timestamp',
             'comment' => 'Thời gian xuất bản',
             'length' => 25,
             ));
        $this->hasColumn('expiredate_time', 'timestamp', 25, array(
             'type' => 'timestamp',
             'comment' => 'Thời gian kết thúc bản tin',
             'length' => 25,
             ));
        $this->hasColumn('meta', 'string', 255, array(
             'type' => 'string',
             'comment' => 'Nội dung meta',
             'length' => 255,
             ));
        $this->hasColumn('keywords', 'string', 255, array(
             'type' => 'string',
             'comment' => 'Nội dung keywords',
             'length' => 255,
             ));
        $this->hasColumn('author', 'string', 255, array(
             'type' => 'string',
             'comment' => 'Tác giả',
             'length' => 255,
             ));
        $this->hasColumn('is_active', 'integer', 5, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 0,
             'comment' => '0 ẩn, 1 hiện',
             'length' => 5,
             ));
        $this->hasColumn('is_hot', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => false,
             'comment' => 'Hiển thị trên trang chủ (0- ko hiển thị, 1- hiển thị)',
             ));
        $this->hasColumn('lang', 'string', 10, array(
             'type' => 'string',
             'notnull' => true,
             'comment' => 'Đa ngôn ngữ',
             'length' => 10,
             ));
        $this->hasColumn('slug', 'string', 255, array(
             'type' => 'string',
             'unique' => true,
             'notnull' => true,
             'comment' => 'chuyển đổi url',
             'length' => 255,
             ));
        $this->hasColumn('category_id', 'integer', 8, array(
             'type' => 'integer',
             'comment' => 'Id của danh mục tin tức',
             'length' => 8,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $vtblameable0 = new Doctrine_Template_VtBlameable();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($vtblameable0);
        $this->actAs($timestampable0);
    }
}