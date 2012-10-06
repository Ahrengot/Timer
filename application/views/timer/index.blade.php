@layout('master')

@section('javascript-templates')
	<script type="text/template" id="templates-timer">

	</script>
@endsection

@section('javascript')
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js'></script>
	<script src='http://underscorejs.org/underscore-min.js'></script>
	<script src='http://backbonejs.org/backbone-min.js'></script>
	
	<script src='{{ asset('/js/Plugins-ck.js'); }}'></script>
	<script src='{{ asset('/js/Main.js'); }}'></script>
@endsection