<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TagPost extends Model
{
	protected $table = 'tagpost';

    protected $fillable = ['id', 'tag_id', 'post_id'];
    //
}
