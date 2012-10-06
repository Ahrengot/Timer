@layout('master')

@section('javascript-templates')
	<script type="text/template" id="template-slips-list">
		<ol class="slips">
			<% _.each(slips, function(slip) { %>
				<li><%= slip.get('description') %></li>
			<% }); %>
		</ol>
	</script>

	<script type="text/template" id="template-track-time">

	</script>

	<script type="text/template" id="template-add-slip">
		<button>Add new slip</button>
		<p><em>Or continue tracking time on one of these:</em></p>
	</script>
@endsection

@section('javascript')
	<script>
		window.BASE_URL = "{{ URL::base(); }}";
	</script>

	{{ HTML::script('https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js'); }}
	{{ HTML::script('http://underscorejs.org/underscore-min.js'); }}
	{{ HTML::script('http://backbonejs.org/backbone-min.js'); }}

	{{ HTML::script('js/Plugins-ck.js'); }}
	{{ HTML::script('js/Main.js'); }}
@endsection