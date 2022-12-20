<?php

namespace App\Policies;

use App\ProductReview;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProductReviewPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\User  $user
     * @param  \App\ProductReview  $productReview
     * @return mixed
     */
    public function view(User $user)
    {
        return $user->checkPermissionAccess('list_review');

    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->checkPermissionAccess('add_review');

    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\ProductReview  $productReview
     * @return mixed
     */
    public function update(User $user)
    {
        return $user->checkPermissionAccess('update_review');

    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\ProductReview  $productReview
     * @return mixed
     */
    public function delete(User $user)
    {
        return $user->checkPermissionAccess('delete_review');

    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\ProductReview  $productReview
     * @return mixed
     */
    public function restore(User $user, ProductReview $productReview)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\ProductReview  $productReview
     * @return mixed
     */
    public function forceDelete(User $user, ProductReview $productReview)
    {
        //
    }
}
