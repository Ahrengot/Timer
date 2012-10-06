@layout('master')

@section('javascript-templates')
	<script type="text/template" id="templates-timer">

	</script>
@endsection

@section('javascript')
	{{ HTML::script('https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js'); }}
	{{ HTML::script('http://underscorejs.org/underscore-min.js'); }}
	{{ HTML::script('http://backbonejs.org/backbone-min.js'); }}
	
	{{ HTML::script('js/Plugins-ck.js'); }}
	{{ HTML::script('js/Main.js'); }}
@endsection