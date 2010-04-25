package com.cafetownsend.service
{
	import com.cafetownsend.domain.Employee;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	import org.swizframework.utils.services.ServiceHelper;
	
	public class EmployeeDelegate implements IEmployeeDelegate
	{
		[Inject(id="employeesService")]
		public var service:HTTPService;

		
		[Inject]
		public var serviceRequestUtil: ServiceHelper;
		
		
		protected var util:MockDelegateHelper;
		
		public function EmployeeDelegate()
		{
			util = new MockDelegateHelper(true);
		}
		
		

		public function loadEmployees():AsyncToken
		{
			return service.send();		
		}
			
		
		public function createEmployee(employee:Employee):AsyncToken
		{
			return util.createMockResult(employee, 300);
		}
		
		
		public function updateEmployee(employee:Employee):AsyncToken
		{
			return util.createMockResult(employee, 300);
		}
		
		
		public function deleteEmployee(employee:Employee):AsyncToken
		{
			return util.createMockResult(employee, 300);
		}
	}
}