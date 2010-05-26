package com.cafetownsend.presentation
{
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.events.ValidationResultEvent;
	import mx.rpc.Fault;
	import mx.validators.StringValidator;
	
	public class LoginPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public static const STATE_DEFAULT:String = "default";
		public static const STATE_ERROR:String = "error";
		
		[Bindable]
		public var currentState:String = STATE_DEFAULT;
		
		
		[Bindable]
		public var loginPending:Boolean = false;
		
		[Bindable]
		[Inject("appModel.lastUsername", bind="true")]
		public var lastUsername:String;
		
		[Bindable]
		public var password:String;
		
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
			currentState = STATE_DEFAULT;		
			
			if( validLoginData(username, password) )
			{
				var user:User = new User(NaN, username, password);
				dispatcher.dispatchEvent(new LoginEvent(LoginEvent.LOGIN, user));

				loginPending = true;
			}
		}
		
		protected var stringValidator:StringValidator;
		
		public function validLoginData(username: String, password: String):Boolean 
		{
			var valid: Boolean = false;
			
			// create stringValidator if not created yet
			stringValidator ||= new StringValidator();
			
			var stringValidation: ValidationResultEvent = stringValidator.validate( username );
			var validUserName:Boolean = stringValidation.results == null;
			usernameError = ( validUserName ) ? "" : "Please enter your username!";

			stringValidation = stringValidator.validate( password );
			var validPassword:Boolean = stringValidation.results == null;
			passwordError = ( validPassword ) ? "" : "Please enter your password!";
			
			return validUserName && validPassword;
		}

		
		
		[Mediate(event="LoginErrorEvent.LOGIN_ERROR", properties="fault")]
		public function handleLoginError(fault:Fault):void
		{
			currentState = STATE_ERROR;
			
			loginError = fault.faultString + ": " + fault.faultDetail;
			
			loginPending = false;
		}

		[Mediate(event="LoginEvent.COMPLETE")]
		public function handleLoginComplete( event: LoginEvent ):void
		{
			loginPending = false;			
		}
	
	}
}