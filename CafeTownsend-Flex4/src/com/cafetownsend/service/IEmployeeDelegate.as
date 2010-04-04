package com.cafetownsend.service
{
	import com.cafetownsend.domain.Employee;
	
	import mx.rpc.AsyncToken;
	
	public interface IEmployeeDelegate
	{
		function loadEmployees():AsyncToken;
		function createEmployee(employee:Employee):AsyncToken;
		function updateEmployee(employee:Employee):AsyncToken;
		function deleteEmployee(employee:Employee):AsyncToken;
	}
}