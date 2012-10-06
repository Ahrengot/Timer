<?php

class Create_Slips_Table {    

	public function up()
    {
		Schema::create('slips', function($table) {
			$table->increments('id');
			$table->string('description');
			$table->integer('duration');
			$table->timestamps();
	});

    }    

	public function down()
    {
		Schema::drop('slips');

    }

}