<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Resturents extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = "restaurants";

    protected $fillable = [
        'name',
        'restaurant_id',
        'latitude',
        'longitude',
        'status',
    ];

}
