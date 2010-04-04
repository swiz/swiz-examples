package com.cafetownsend.event
{
	import flash.events.Event;
	
	import mx.rpc.Fault;
	
	public class LoginErrorEvent extends Event
	{
		public static const LOGIN_ERROR:String = "loginError";
		
		private var _fault:Fault;
		
		public function get fault():Fault
		{
			return _fault;
		}
		
		public function LoginErrorEvent(type:String, fault:Fault, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_fault = fault;
		}
		
		override public function clone():Event
		{
			return new LoginErrorEvent(LoginErrorEvent.LOGIN_ERROR, fault, bubbles, cancelable);
		}
	}
}