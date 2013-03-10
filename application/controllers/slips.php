<?php

class Slips_Controller extends Base_Controller {    

	public function action_index() {
        $all_slips = Slip::all();
        return eloquent_to_json($all_slips);
    }

    public function action_create() {
        $data = Input::json();
        
        $time_slip = Slip::create(array(
            'description' => $data->description,
            'duration' => $data->duration
        ));
        
        return eloquent_to_json($time_slip);
    }   

	public function action_show() {
        $id = (int) URI::segment(2);
        $slip = Slip::find($id);
        return eloquent_to_json($slip); // eloquent_to_json is better than json_encode because it doesn't wrap single results in an array 
    }    

    public function action_update() {
        $data = Input::json();
        $slip = Slip::find($data->id);
        $slip->description = $data->description;
        $slip->duration = $data->duration;
        $slip->save();
    }
}