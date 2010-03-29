package com.cafetownsend.business
{
	import mx.rpc.AsyncToken;
	
	public interface IUserDelegate
	{
		function login(username:String, password:String):AsyncToken;
	}
}