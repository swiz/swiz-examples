package com.cafetownsend.event
{
	import com.cafetownsend.domain.User;
	
	import flash.events.Event;
	
	import mx.rpc.Fault;
	
	public class LoginEvent extends Event
	{

		public static const LOGIN:String = "LoginEvent.LOGIN";
		public static const LOGIN_ERROR:String = "LoginEvent.LOGIN_ERROR";
		
		public static const LOGOUT:String = "LoginEvent.LOGOUT";
		
		public static const COMPLETE:String = "LoginEvent.COMPLETE";
		
		
		public var user:User;
		public var loginFault:Fault;
		
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var event: LoginEvent = new LoginEvent( type, bubbles, cancelable );
			event.user = this.user;
			event.loginFault = this.loginFault;
			
			return event;
		}
	}
}