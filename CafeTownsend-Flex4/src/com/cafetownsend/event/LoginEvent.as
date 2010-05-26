package com.cafetownsend.event
{
	import com.cafetownsend.domain.User;
	
	import flash.events.Event;
	
	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "LoginEvent.LOGIN";
		public static const LOGOUT:String = "LoginEvent.LOGOUT";
		public static const COMPLETE:String = "LoginEvent.COMPLETE";
		
		private var _user:User;
		
		public function get user():User
		{
			return _user;
		}
		
		public function LoginEvent(type:String, user:User = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_user = user;
		}
		
		override public function clone():Event
		{
			return new LoginEvent(type, user, bubbles, cancelable);
		}
	}
}