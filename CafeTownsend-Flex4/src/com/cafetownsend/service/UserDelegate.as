package com.cafetownsend.service
{
	import com.cafetownsend.domain.User;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	import org.swizframework.utils.services.MockDelegateUtil;
	
	public class UserDelegate implements IUserDelegate
	{
		protected var util:MockDelegateUtil;
		
		public function UserDelegate()
		{
			util = new MockDelegateUtil(true);
		}
		
		public function login(username:String, password:String):AsyncToken
		{
			if( username == "Flex" && password == "Swiz" )
			{
				var user:User = new User(1, username);
				return util.createMockResult(user, 750);
			}
			
			var fault:Fault = new Fault("0", "Login failed", "username/password does not match");
			return util.createMockFault(fault, 250);
		}
	}
}