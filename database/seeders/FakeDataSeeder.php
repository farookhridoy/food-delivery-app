<?php

namespace Database\Seeders;

use App\Models\Resturents;
use App\Models\RiderMovements;
use App\Models\Riders;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;


class FakeDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        foreach (range(1, 10) as $index) {
            $resturent = Resturents::create([
                'name' => fake()->name(),
                'restaurant_id' => Str::random(10),
                'latitude' => fake()->latitude(-90, 90),
                'longitude' => fake()->longitude(),
            ]);

            $rider = Riders::create([
                'name' => fake()->name(),
                'rider_id' => Str::random(10),
            ]);

            $movement = RiderMovements::create([
                'rider_id' => $rider->id,
                'service_name' => 'Food delivery',
                'latitude' => fake()->latitude(-90, 90),
                'longitude' => fake()->longitude(),
                'movement_time' => date('Y-m-d h:i:s'),
            ]);
        }
    }
}
