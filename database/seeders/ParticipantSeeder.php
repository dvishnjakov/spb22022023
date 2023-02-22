<?php

namespace Database\Seeders;

use App\Models\Participant;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ParticipantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Participant::factory()
            ->count(100)
            ->create()
            ->map(function ($participant){
                $participant->santa_id = Participant::query()
                    ->where('id', '!=', $participant->id)
                    ->inRandomOrder()
                    ->first()
                    ->id;
                $participant->save();
            });
    }
}
