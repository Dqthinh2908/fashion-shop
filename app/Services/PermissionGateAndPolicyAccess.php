<?php

namespace App\Services;
use Illuminate\Support\Facades\Gate;


class PermissionGateAndPolicyAccess{
    public function setGateAndPolicyAccess()
    {
        $this->defineGateBanner();
        $this->defineGateProduct();
        $this->defineGatePost();
        $this->defineGateBrand();
        $this->defineGateTranfer();
        $this->defineGateOrder();
        $this->defineGatePostCategory();
        $this->defineGateRole();
        $this->defineGateUser();
        $this->defineGateCoupon();
        $this->defineGateMedia();
        $this->defineGateProductReview();
        $this->defineGatePostTag();
        $this->defineGateComment();
        $this->defineGateSetting();
        $this->defineGateProductCategory();



    }
    public function defineGateBanner()
    {
        Gate::define('list_banner','App\Policies\BannerPolicy@view');
        Gate::define('add_banner', 'App\Policies\BannerPolicy@create');
        Gate::define('update_banner', 'App\Policies\BannerPolicy@update');
        Gate::define('delete_banner','App\Policies\BannerPolicy@delete');
    }

    public function defineGateProduct()
    {
        Gate::define('list_products','App\Policies\ProductPolicy@view');
        Gate::define('add_products', 'App\Policies\ProductPolicy@create');
        Gate::define('update_products', 'App\Policies\ProductPolicy@update');
        Gate::define('delete_products','App\Policies\ProductPolicy@delete');
    }
    public function defineGateBrand()
    {
        Gate::define('list_brand','App\Policies\BrandPolicy@view');
        Gate::define('add_brand', 'App\Policies\BrandPolicy@create');
        Gate::define('update_brand', 'App\Policies\BrandPolicy@update');
        Gate::define('delete_brand','App\Policies\BrandPolicy@delete');
    }
    public function defineGateTranfer()
    {
        Gate::define('list_transfer','App\Policies\TranferPolicy@view');
        Gate::define('add_transfer', 'App\Policies\TranferPolicy@create');
        Gate::define('update_transfer', 'App\Policies\TranferPolicy@update');
        Gate::define('delete_transfer','App\Policies\TranferPolicy@delete');
    }
    public function defineGateOrder()
    {
        Gate::define('list_order','App\Policies\OrderPolicy@view');
        Gate::define('add_order', 'App\Policies\OrderPolicy@create');
        Gate::define('update_order', 'App\Policies\OrderPolicy@update');
        Gate::define('delete_order','App\Policies\OrderPolicy@delete');
    }
    public function defineGatePost()
    {
        Gate::define('list_post','App\Policies\PostPolicy@view');
        Gate::define('add_post', 'App\Policies\PostPolicy@create');
        Gate::define('update_post', 'App\Policies\PostPolicy@update');
        Gate::define('delete_post','App\Policies\PostPolicy@delete');
    }
    public function defineGatePostCategory()
    {
        Gate::define('list_post_category','App\Policies\PostCategoryPolicy@view');
        Gate::define('add_post_category', 'App\Policies\PostCategoryPolicy@create');
        Gate::define('update_post_category', 'App\Policies\PostCategoryPolicy@update');
        Gate::define('delete_post_category','App\Policies\PostCategoryPolicy@delete');
    }
    public function defineGateProductCategory()
    {
        Gate::define('list_categories','App\Policies\CategoryPolicy@view');
        Gate::define('add_categories', 'App\Policies\CategoryPolicy@create');
        Gate::define('update_categories', 'App\Policies\CategoryPolicy@update');
        Gate::define('delete_categories','App\Policies\CategoryPolicy@delete');
    }
    public function defineGateRole()
    {
        Gate::define('list_role','App\Policies\RolePolicy@view');
        Gate::define('add_role', 'App\Policies\RolePolicy@create');
        Gate::define('update_role', 'App\Policies\RolePolicy@update');
        Gate::define('delete_role','App\Policies\RolePolicy@delete');
    }
    public function defineGateUser()
    {
        Gate::define('list_account','App\Policies\UserPolicy@view');
        Gate::define('add_account', 'App\Policies\UserPolicy@create');
        Gate::define('update_account', 'App\Policies\UserPolicy@update');
        Gate::define('delete_account','App\Policies\UserPolicy@delete');
    }
    public function defineGateCoupon()
    {
        Gate::define('list_coupon','App\Policies\CouponPolicy@view');
        Gate::define('add_coupon', 'App\Policies\CouponPolicy@create');
        Gate::define('update_coupon', 'App\Policies\CouponPolicy@update');
        Gate::define('delete_coupon','App\Policies\CouponPolicy@delete');
    }
    public function defineGateMedia()
    {
        Gate::define('list_media','App\Policies\MediaPolicy@view');
    }
    public function defineGateProductReview()
    {
        Gate::define('list_review','App\Policies\ProductReviewPolicy@view');
        Gate::define('add_review', 'App\Policies\ProductReviewPolicy@create');
        Gate::define('update_review', 'App\Policies\ProductReviewPolicy@update');
        Gate::define('delete_review','App\Policies\ProductReviewPolicy@delete');
    }
    public function defineGatePostTag()
    {
        Gate::define('list_tags','App\Policies\PostTagPolicy@view');
        Gate::define('add_tags', 'App\Policies\PostTagPolicy@create');
        Gate::define('update_tags', 'App\Policies\PostTagPolicy@update');
        Gate::define('delete_tags','App\Policies\PostTagPolicy@delete');
    }
    public function defineGateComment()
    {
        Gate::define('list_comment','App\Policies\CommentPolicy@view');
        Gate::define('add_comment', 'App\Policies\CommentPolicy@create');
        Gate::define('update_comment', 'App\Policies\CommentPolicy@update');
        Gate::define('delete_comment','App\Policies\CommentPolicy@delete');
    }
    public function defineGateSetting()
    {
        Gate::define('list_setting','App\Policies\SettingPolicy@view');
        Gate::define('update_setting', 'App\Policies\SettingPolicy@update');
    }


}
