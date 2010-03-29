package com.cafetownsend.business
{
	import com.cafetownsend.domain.User;
	
	import mx.rpc.AsyncToken;
	
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
			var user:User = new User(1, username);
			return util.createMockResult(user, 750);
		}
	}
}