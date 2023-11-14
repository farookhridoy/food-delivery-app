<?php

function calculateDistance($restaurantLat, $restaurantLon, $riderLat, $riderLon)
{
    $earthRadius = 6371; // in kilometers

    $dLat = deg2rad($riderLat - $restaurantLat);
    $dLon = deg2rad($riderLon - $restaurantLon);

    $a = sin($dLat / 2) * sin($dLat / 2) + cos(deg2rad($restaurantLat)) * cos(deg2rad($riderLat)) * sin($dLon / 2) * sin($dLon / 2);
    $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

    $distance = $earthRadius * $c;

    return $distance;
}
