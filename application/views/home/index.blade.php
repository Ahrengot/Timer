@layout('master')

@section('page-content')
	{{ Form::open('/') }}
		{{ Form::text('url') }}
		{{ Form::submit('Shorten') }}
	{{ Form::close() }}

	{{ $errors->first('url', '<p class="error">:message</p>') }}
	{{ $errors->first('required', '<p class="error">:message</p>') }}
@endsection
