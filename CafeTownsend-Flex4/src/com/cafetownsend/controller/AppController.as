package com.cafetownsend.controller
{
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginErrorEvent;
	import com.cafetownsend.event.LoginEvent;
	import com.cafetownsend.model.AppModel;
	import com.cafetownsend.service.IUserDelegate;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.storage.SharedObjectBean;
	import org.swizframework.utils.services.ServiceRequestUtil;
	
	public class AppController
	{
		[Inject]
		public var model:AppModel;
		
		[Inject]
		public var userDelegate:IUserDelegate;
		
		[Inject]
		public var serviceRequestUtil:ServiceRequestUtil;
		
		[Inject]
		public var soBean:SharedObjectBean;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function AppController()
		{
		}
		
		[PostConstruct]
		public function init():void{
			var lastUsername:String = soBean.getString("lastUsername");
			if(lastUsername != null){
				model.lastUsername = lastUsername;
			}
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
			
			model.lastUsername = user.username; 
			soBean.setString("lastUsername", user.username);
				
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