<?php

namespace App;

use Phoenix\EloquentMeta\MetaTrait;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Posts extends Model
{
	use Sluggable, // Tạo Slug đường dẫn thân thiện
        MetaTrait;

 	public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
    protected $fillable = [
        'cate_id', 'user_created', 'user_update', 'title', 'description', 'content', 'slug', 'thumbnail', 'type', 'show_home', 'oder', 'views', 'status'
    ];

 	protected $appends = [
 	    'cm_count', 'view'
    ];

 	protected $casts = [
 	    'status'
    ];

    public function getViewAttribute()
    {
        return $this->getMeta('view');
 	}

    public function getCmCountAttribute()
    {
        $check = $this->comments()->where([
            ['status', 1],
            ['parent_id', 0]
        ])->count();

        $count = $this->comments()->count();

        if ($count != 0 && $check > 0) {
            return $count;
        }
        return 0;
 	}

    public function getStatusAttribute($value)
    {
        if (is_active('posts.index')) {
            if (!$value) {
                return 'Không công khai';
            }
            return 'Công khai';
        }
        return $value;
    }

    public function getUpdatedAtAttribute($value)
    {
        return makeTimeAgo($value);
    }
    public function getCreatedAtAttribute($value)
    {
        return makeTimeAgo($value);
    }

    public function User()
    {
        return $this->belongsTo('App\User', 'user_created');
    }

    public function categories()
    {
        return $this->belongsTo('App\Categories', 'cate_id');
    }

    public function comments()
    {
        return $this->hasMany('App\Comments', 'post_id');
    }

}
