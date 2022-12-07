<?php

namespace App\Services;
use Illuminate\Support\Facades\Gate;


class PermissionGateAndPolicyAccess{
    public function setGateAndPolicyAccess()
    {
        $this->defineGateBanner();
        $this->defineGateProduct();
        $this->defineGatePost();
        $this->defineGateCategory();
        $this->defineGateUser();
        $this->defineGateRole();
        $this->defineGateComment();
        $this->defineGateHome();

    }
    public function defineGateBanner()
    {
        Gate::define('list_banner','App\Policies\BrandPolicy@view');
        Gate::define('add_banner', 'App\Policies\BrandPolicy@create');
        Gate::define('update_banner', 'App\Policies\BrandPolicy@update');
        Gate::define('delete_banner','App\Policies\BrandPolicy@delete');
    }
    public function defineGatePost()
    {
        Gate::define('post_list','App\Policies\PostPolicy@view');
        Gate::define('post_add', 'App\Policies\PostPolicy@create');
        Gate::define('post_edit', 'App\Policies\PostPolicy@update');
        Gate::define('post_delete','App\Policies\PostPolicy@delete');
        Gate::define('post_trash','App\Policies\PostPolicy@trash');
    }
    public function defineGateProduct()
    {
        Gate::define('list_products','App\Policies\ProductPolicy@view');
        Gate::define('add_products', 'App\Policies\ProductPolicy@create');
        Gate::define('update_products', 'App\Policies\ProductPolicy@update');
        Gate::define('delete_products','App\Policies\ProductPolicy@delete');
    }
    public function defineGateCategory()
    {
        Gate::define('list_categories','App\Policies\CategoryPolicy@view');
        Gate::define('add_categories', 'App\Policies\CategoryPolicy@create');
        Gate::define('update_categories', 'App\Policies\CategoryPolicy@update');
        Gate::define('delete_categories','App\Policies\CategoryPolicy@delete');
        Gate::define('category_trash','App\Policies\CategoryPolicy@trash');
    }
    public function defineGateUser()
    {
        Gate::define('user_list','App\Policies\UserPolicy@view');
        Gate::define('user_add', 'App\Policies\UserPolicy@create');
        Gate::define('user_edit', 'App\Policies\UserPolicy@update');
        Gate::define('user_delete','App\Policies\UserPolicy@delete');
        Gate::define('user_trash','App\Policies\UserPolicy@trash');
    }
    public function defineGateRole()
    {
        Gate::define('role_list','App\Policies\RolePolicy@view');
        Gate::define('role_add', 'App\Policies\RolePolicy@create');
        Gate::define('role_edit', 'App\Policies\RolePolicy@update');
        Gate::define('role_delete','App\Policies\RolePolicy@delete');
        Gate::define('role_trash','App\Policies\RolePolicy@trash');
    }
    public function defineGateComment()
    {
        Gate::define('comment_list','App\Policies\CommentPolicy@view');
        Gate::define('comment_add', 'App\Policies\CommentPolicy@create');
        Gate::define('comment_edit', 'App\Policies\CommentPolicy@update');
        Gate::define('comment_delete','App\Policies\CommentPolicy@delete');
        Gate::define('comment_trash','App\Policies\CommentPolicy@trash');
    }
    public function defineGateHome()
    {
        Gate::define('home_list','App\Policies\HomePolicy@view');
    }
}
