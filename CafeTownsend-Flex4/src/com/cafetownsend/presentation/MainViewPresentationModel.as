package com.cafetownsend.presentation
{
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class MainViewPresentationModel extends EventDispatcher
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject("appModel.user")]
		[Bindable]
		public var user: User;
		
		//--------------------------------------------------------------------------
		//
		// view state
		//
		//--------------------------------------------------------------------------
		
		
		public static const CURRENT_STATE_CHANGED:String = "currentStateChanged";
		
		private var _currentState:String;
		
		[Inject("navModel.path")]
		[Bindable(event="currentStateChanged")]
		public function get currentState():String
		{
			return _currentState;
		}
		
		public function set currentState( value: String ):void
		{
			//
			// get the second path value only
			var newState: String = value.split("/")[0];
			
			if ( _currentState != newState ) 
			{			
				_currentState = newState;
				this.dispatchEvent( new Event( CURRENT_STATE_CHANGED ) );
			}
		}
		
		
		//--------------------------------------------------------------------------
		//
		// public methods called by its view
		//
		//--------------------------------------------------------------------------
		
		public function logout() : void 
		{
			dispatcher.dispatchEvent( new LoginEvent( LoginEvent.LOGOUT, null, true ) );
		}
		

	}
}