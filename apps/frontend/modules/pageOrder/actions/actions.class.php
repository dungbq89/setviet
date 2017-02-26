<?php
/**
 * Created by PhpStorm.
 * User: Ta Van Ngoc
 * Date: 7/28/15
 * Time: 11:33 PM
 */

class pageOrderActions extends sfActions {
    public function executeIndex(sfWebRequest $request) {
        $id = $request->getParameter('id',null);
        if($id){
            $product = VtpProductsTable::getProductById($id);
            if($product){
                $this->product = $product;
            }
        }
        $form=new orderForm();

        if($request->isMethod('POST')){
            $values = $request->getParameter($form->getName());
            $form->bind($values,$request->getFiles($form->getName()));
            if($form->isValid()){
                $reg = new AdOrder();
                $reg->setCustomerName($values['customer_name']);
                $reg->setCustomerPhone($values['customer_phone']);
                $reg->setCustomerAddress($values['customer_address']);
                $price = $product->getPricePromotion()?$product->getPricePromotion():$product->getPrice();
                $reg->setBody($values['body']);
                $reg->setPrice($price);
                $reg->setTitle($product->product_name);
                $reg->save();
                $this->getUser()->setFlash('success','Đặt hàng thành công, chúng tôi sẽ liên hệ vói bạn trong thời gian sớm nhất.');
                $form = new orderForm();
            }
        }
        $this->form=$form;
    }
}