<?php

class Slips_Controller extends Base_Controller {    

	public function action_index() {

    }

    public function action_create() {
        $data = Input::json();
        
        $time_slip = Slip::create(array(
            'description' => $data->description,
            'duration' => $data->duration
        ));

        return $time_slip;
    }   

	public function action_show() {
        $id = (int) URI::segment(2);
        $slip = Slip::find($id);
        return eloquent_to_json($slip); // eloquent_to_json is better than json_encode because it doesn't wrap single results in an array 
    }    

	public function action_edit() {

    }    

	public function action_new() {

    }

}