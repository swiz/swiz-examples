package com.cafetownsend.service
{
	import mx.rpc.AsyncToken;
	
	public interface IUserDelegate
	{
		function login(username:String, password:String):AsyncToken;
	}
}