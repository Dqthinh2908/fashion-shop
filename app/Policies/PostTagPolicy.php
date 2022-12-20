<?php

namespace App\Policies;

use App\PostTag;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class PostTagPolicy
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
     * @param  \App\PostTag  $postTag
     * @return mixed
     */
    public function view(User $user)
    {
        return $user->checkPermissionAccess('list_tags');

    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->checkPermissionAccess('add_tags');

    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostTag  $postTag
     * @return mixed
     */
    public function update(User $user)
    {
        return $user->checkPermissionAccess('update_tags');

    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostTag  $postTag
     * @return mixed
     */
    public function delete(User $user)
    {
        return $user->checkPermissionAccess('delete_tags');

    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostTag  $postTag
     * @return mixed
     */
    public function restore(User $user, PostTag $postTag)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostTag  $postTag
     * @return mixed
     */
    public function forceDelete(User $user, PostTag $postTag)
    {
        //
    }
}
