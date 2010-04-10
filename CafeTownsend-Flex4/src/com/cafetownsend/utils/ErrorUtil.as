package com.cafetownsend.utils
{
	import mx.controls.Alert;

	public final class ErrorUtil
	{

		public static function showError(msg: String):void
		{		
			Alert.show( msg, "ERROR" );
		}	
	}
}