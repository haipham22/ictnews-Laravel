<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    protected $fillable = [
        'user_id', 'post_id', 'parent_id', 'content', 'status'
    ];


    protected $casts = [
        'status'    => 'boolean',
    ];

    public function setUserIdAttribute($value)
    {
        $this->attributes['user_id'] = !empty($value) ? $value : Auth::user()->id;
    }
}
