package com.cafetownsend.controller
{
	import com.cafetownsend.service.IUserDelegate;
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginErrorEvent;
	import com.cafetownsend.event.LoginEvent;
	import com.cafetownsend.model.AppModel;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceRequestUtil;
	
	public class AppController
	{
		[Inject]
		public var model:AppModel;
		
		[Inject]
		public var userDelegate:IUserDelegate;
		
		[Inject]
		public var serviceRequestUtil:ServiceRequestUtil;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function AppController()
		{
		}
		
		[Mediate(event="LoginEvent.LOGOUT")]
		public function logout():void
		{
			model.user = null;
			model.currentState = AppModel.STATE_LOGIN;
		}
		
		[Mediate(event="LoginEvent.LOGIN", properties="user")]
		public function login(user:User):void
		{
			model.loginPending = true;
			var call:AsyncToken = userDelegate.login(user.username, user.password);
			serviceRequestUtil.executeServiceCall(call, loginResultHandler, loginFaultHandler);
		}
		
		protected function loginResultHandler(event:ResultEvent):void
		{
			var user:User = event.result as User;
			model.user = user;
			model.loginPending = false;
			model.currentState = AppModel.STATE_EMPLOYEE;
			dispatcher.dispatchEvent(new LoginEvent(LoginEvent.COMPLETE, user));
		}
		
		protected function loginFaultHandler(event:FaultEvent):void
		{
			model.loginPending = false;
			dispatcher.dispatchEvent(new LoginErrorEvent(LoginErrorEvent.LOGIN_ERROR, event.fault));
		}
	}
}