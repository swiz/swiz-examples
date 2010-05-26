package com.cafetownsend.domain.test
{
	import com.cafetownsend.domain.User;
	
	import flexunit.framework.Assert;

	
	public class UserTest
	{	
		
		[Test(description="Setting of initial properties by constructor")]
		public function setPropertiesUsingConstructor():void
		{
			var user:User = new User( 1, "Luke Skywalker", "1234" );
			
			Assert.assertEquals("id ", 1, user.id );
			Assert.assertEquals("username ", "Luke Skywalker", user.username );
			Assert.assertEquals("password ", "1234", user.password );			
			
		}
		

	}
}