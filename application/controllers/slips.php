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

    }    

	public function action_edit() {

    }    

	public function action_new() {

    }

}