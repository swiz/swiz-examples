package com.cafetownsend.domain
{
	[RemoteClass("com.cafetownsend.domain.User")]
	public class User
	{
		public var id:Number;
		
		[Bindable]
		public var username:String;
		
		[Bindable]
		public var password:String;
		
		public function User(id:Number = NaN, username:String = null, password:String = null)
		{
			this.id = id;
			this.username = username;
			this.password = password;
		}
	}
}