package com.cafetownsend.business
{
	import mx.rpc.AsyncToken;
	
	import org.swizframework.utils.services.MockDelegateUtil;
	
	public class EmployeeDelegate implements IEmployeeDelegate
	{
		
		protected var util:MockDelegateUtil;
		
		public function EmployeeDelegate()
		{
			util = new MockDelegateUtil(true);
		}
		
		public function loadEmployees():AsyncToken
		{
			return null;
		}
		
		public function createEmployee():AsyncToken
		{
			return null;
		}
		
		public function deleteEmployee():AsyncToken
		{
			return null;
		}
	}
}