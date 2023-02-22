<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreParticipantRequest;
use App\Http\Requests\UpdateParticipantRequest;
use App\Http\Resources\ParticipantResource;
use App\Models\Participant;
use Illuminate\Http\JsonResponse;

class ParticipantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreParticipantRequest  $request
     */
    public function store(StoreParticipantRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  Participant  $participant
     */
    public function show(Participant $participant): ParticipantResource
    {
        $participant->load('santa');

        return new ParticipantResource($participant);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Participant  $participant
     */
    public function edit(Participant $participant)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateParticipantRequest  $request
     * @param  Participant  $participant
     */
    public function update(UpdateParticipantRequest $request, Participant $participant)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Participant  $participant
     */
    public function destroy(Participant $participant)
    {
        //
    }
}
