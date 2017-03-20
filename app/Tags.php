<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Tags extends Model
{
	use Sluggable; // Tạo Slug đường dẫn thân thiện

 	public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'tag_name'
            ]
        ];
    }

    protected $fillable = ['id', 'tag_name', 'posts_id', 'slug'];
}
