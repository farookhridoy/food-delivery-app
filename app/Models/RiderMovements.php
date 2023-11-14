<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RiderMovements extends Model
{
    use HasFactory;

    protected $table = "rider_movements";

    protected $fillable = [
        'rider_id',
        'service_name',
        'latitude',
        'longitude',
        'movement_time',
    ];

    public function rider(): BelongsTo
    {
        return $this->belongsTo(Riders::class, "rider_id", "id");
    }
}
