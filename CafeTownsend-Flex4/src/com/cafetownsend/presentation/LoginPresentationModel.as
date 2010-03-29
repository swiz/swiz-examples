package com.cafetownsend.presentation
{
	import com.cafetownsend.event.LoginEvent;
	
	import flash.events.IEventDispatcher;
	
	public class LoginPresentationModel
	{
		
		[Bindable]
		[Inject("appModel.loginPending")]
		public var loginPending:Boolean;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function LoginPresentationModel()
		{
		}
		
		public function login(username:String, password:String):void
		{
			dispatcher.dispatchEvent(new LoginEvent(LoginEvent.LOGIN, username, password));
		}
	
	}
}