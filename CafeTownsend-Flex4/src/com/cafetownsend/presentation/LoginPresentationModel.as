package com.cafetownsend.presentation
{
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.Fault;
	
	public class LoginPresentationModel
	{
		private static const STATE_DEFAULT:String = "default";
		private static const STATE_ERROR:String = "error";
		
		[Bindable]
		[Inject("appModel.loginPending")]
		public var loginPending:Boolean;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var currentState:String = STATE_DEFAULT;
		
		[Bindable]
		public var usernameError:String;
		
		[Bindable]
		public var passwordError:String;
		
		[Bindable]
		public var loginError:String;
		
		public function LoginPresentationModel()
		{
		}
		
		public function login(username:String, password:String):void
		{
			usernameError = username == "" ? "Please enter your username!" : null;
			passwordError = password == "" ? "Please enter your password!" : null;
			
			currentState = STATE_DEFAULT;
			
			if( !usernameError && !passwordError )
			{
				var user:User = new User(NaN, username, password);
				dispatcher.dispatchEvent(new LoginEvent(LoginEvent.LOGIN, user));
			}
		}
		
		[Mediate(event="LoginErrorEvent.LOGIN_ERROR", properties="fault")]
		public function handleLoginError(fault:Fault):void
		{
			currentState = STATE_ERROR;
			loginError = fault.faultString + ": " + fault.faultDetail;
		}
	
	}
}