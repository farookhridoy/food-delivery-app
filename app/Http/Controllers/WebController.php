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

    public function findRiders(string $restaurant_id): \Illuminate\Http\JsonResponse
    {
        try {
            $restaurant = Resturents::where('restaurant_id', $restaurant_id)->first();
            if ($restaurant) {
                $movements = RiderMovements::all();

                $riderIds=[];
                foreach ($movements as $movement){
                    $distance = calculateDistance($restaurant->latiture, $restaurant->longitude, $movement->latitude,
                        $movement->longitude);

                    $rider = RiderMovements::select(DB::raw('*, ( 6367 * acos( cos( radians(' . $restaurant->latiture . ') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(' . $restaurant->longitude . ') ) + sin( radians(' . $restaurant->latiture . ') ) * sin( radians( lat ) ) ) ) AS distance'))
                        ->having('distance', '<', $distance)
                        ->orderBy('distance')->first();

                    $riderIds[] = $rider->rider_id;
                }

                $riders = Riders::whereIn('id',$riderIds)->get();

                return response()->json($riders);
            }
            return response()->json('No data found', 404);
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), $th->getCode());
        }
    }

}
