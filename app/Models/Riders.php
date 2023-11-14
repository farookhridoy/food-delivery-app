<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Riders extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = "riders";

    protected $fillable = [
        'name',
        'rider_id',
        'status',
    ];

    public function riderMovements(): HasMany
    {
        return $this->hasMany(RiderMovements::class, "rider_id", "id");
    }

}
