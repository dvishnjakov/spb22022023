<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Participant extends Model
{
    use HasFactory;

    public function santa(): HasOne
    {
        return $this->hasOne(Participant::class, 'id', 'santa_id');
    }
}
