package com.cafetownsend.presentation
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class EmployeesPresentationModel extends EventDispatcher
	{

		private static const LOG: ILogger = Log.getLogger("EmployeesPresentationModel");		

		public static const CURRENT_STATE_CHANGED:String = "currentStateChanged";
		
		private var _currentState:String;		

		[Inject("navModel.path", bind="true")]
		[Bindable(event="currentStateChanged")]
		public function set currentState( value: String ):void
		{
			//
			// get the second path value only
			var newState: String = value.split("/")[1];
				
			if ( _currentState != newState ) 
			{			
				_currentState = newState;
				this.dispatchEvent( new Event( CURRENT_STATE_CHANGED ) );
			}
		}
		
		
		public function get currentState():String
		{
			return _currentState;
		}

	}
}