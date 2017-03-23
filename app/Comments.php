<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    /**
     * Quỳ thanh niên viết database -_-
     *
     * @var string
     */
    protected $table = 'comment';

    protected $fillable = [
        'user_id', 'post_id', 'parent_id', 'content', 'status'
    ];


    protected $casts = [
        'status'    => 'boolean',
    ];

    protected $appends = [
        'name', 'parent'
    ];

    public function getNameAttribute()
    {
        return $this->user()->first()->username;
    }

    public function getParentAttribute()
    {
        return $this->post()->first()->title;
    }

    public function setStatusAttribute($value)
    {
        $this->attributes['status'] = !empty($value) ? $value : 0;
    }

    public function setUserIdAttribute($value)
    {
        $this->attributes['user_id'] = !empty($value) ? $value : Auth::user()->id;
    }

    public function post()
    {
        return $this->belongsTo('App\Posts', 'post_id');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
}
