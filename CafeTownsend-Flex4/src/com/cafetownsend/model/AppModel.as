package com.cafetownsend.model
{
	import com.cafetownsend.domain.User;
	
	public class AppModel
	{
		public static const STATE_LOGIN:String = "login";
		public static const STATE_EMPLOYEE:String = "employee";
		
		[Bindable]
		public var currentState:String = STATE_LOGIN;
		
		[Bindable]
		public var lastUsername:String;
		
		[Bindable]
		public var loginPending:Boolean = false;
		
		[Bindable]
		public var user:User;
		
		public function AppModel()
		{
		}
	}
}