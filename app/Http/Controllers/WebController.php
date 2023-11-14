<?php

namespace App\Http\Controllers;

use App\Models\Resturents;
use App\Models\RiderMovements;
use App\Models\Riders;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WebController extends Controller
{

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "rider_id" => ["required", "string", "max:32"],
            "service_name" => ["required", "string", "max:32"],
            "latitude" => ["required", "string", "max:32"],
            "longitude" => ["required", "string", "max:32"],
            "movement_time" => ["required", "max:32"],
        ]);

        $input = $request->all();
        $rider = Riders::where('rider_id', $input['rider_id'])->first();
        if ($rider) {
            DB::beginTransaction();
            try {
                $input['rider_id'] = $rider->id;
                $movement = RiderMovements::create($input);
                DB::commit();
                return response()->json($movement);
            } catch (\Throwable $th) {
                DB::rollBack();
                return response()->json($th->getMessage(), $th->getCode());
            }
        }
        return response()->json('Rider id is invalid', 404);
    }

    /**
     * Display the specified resource.
     */

    public function findRiders(string $restaurant_id)
    {
        try {
            $restaurant = Resturents::where('restaurant_id', $restaurant_id)->first();
            if ($restaurant) {
                $rider = collect(DB::select("SELECT rider_id, latitude, longitude, SQRT(POW(69.1 * (latitude - $restaurant->latitude), 2) + POW(69.1 * ($restaurant->longitude - longitude) * COS(latitude / 57.3), 2)) AS distance FROM rider_movements where `movement_time` <= '".date('Y-m-d H:i:s', strtotime('-5 minutes'))."' ORDER BY distance asc limit 1"))->first();

                return response()->json([
                    'rider' => Riders::find($rider->rider_id),
                    'distance' => $rider->distance,
                    'latitude' => $rider->latitude,
                    'longitude' => $rider->longitude,
                ], 200);
            }
            return response()->json('No data found', 404);
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), $th->getCode());
        }
    }

}
