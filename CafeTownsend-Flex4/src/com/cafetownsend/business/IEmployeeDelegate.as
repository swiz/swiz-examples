package com.cafetownsend.business
{
	import mx.rpc.AsyncToken;
	
	public interface IEmployeeDelegate
	{
		function loadEmployees():AsyncToken;
		function createEmployee():AsyncToken;
		function deleteEmployee():AsyncToken;
	}
}