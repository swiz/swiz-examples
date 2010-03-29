package com.cafetownsend.model
{
	public class AppModel
	{
		public static const STATE_LOGIN:String = "login";
		public static const STATE_EMPLOYEE:String = "employee";
		
		[Bindable]
		public var currentState:String = STATE_LOGIN;
		
		[Bindable]
		public var loginPending:Boolean = false;
		
		public function AppModel()
		{
		}
	}
}