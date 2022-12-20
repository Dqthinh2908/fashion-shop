<?php

namespace App\Policies;

use App\PostComment;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CommentPolicy
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
     * @param  \App\PostComment  $postComment
     * @return mixed
     */
    public function view(User $user)
    {
        return $user->checkPermissionAccess('list_comment');

    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->checkPermissionAccess('add_comment');

    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostComment  $postComment
     * @return mixed
     */
    public function update(User $user)
    {
        return $user->checkPermissionAccess('update_comment');

    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostComment  $postComment
     * @return mixed
     */
    public function delete(User $user)
    {
        return $user->checkPermissionAccess('delete_comment');

    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostComment  $postComment
     * @return mixed
     */
    public function restore(User $user, PostComment $postComment)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\PostComment  $postComment
     * @return mixed
     */
    public function forceDelete(User $user, PostComment $postComment)
    {
        //
    }
}
