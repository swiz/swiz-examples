package com.cafetownsend.controller
{
	import com.cafetownsend.business.IUserDelegate;
	import com.cafetownsend.model.AppModel;
	
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
		
		public function AppController()
		{
		}
		
		[Mediate(event="LoginEvent.LOGIN", properties="username, password")]
		public function login(username:String, password:String):void
		{
			model.loginPending = true;
			var call:AsyncToken = userDelegate.login(username, password);
			serviceRequestUtil.executeServiceCall(call, loginResultHandler, loginFaultHandler, [username]);
		}
		
		protected function loginResultHandler(event:ResultEvent, username:String):void
		{
			model.loginPending = false;
			model.currentState = AppModel.STATE_EMPLOYEE;
		}
		
		protected function loginFaultHandler(event:FaultEvent):void
		{
			model.loginPending = false;
		}
	}
}