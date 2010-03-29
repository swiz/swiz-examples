package com.cafetownsend.business
{
	import com.cafetownsend.domain.Employee;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
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
			var employee1:Employee = new Employee();
			employee1.id = 1;
			employee1.firstName = "John"
			employee1.lastName = "Doe";
			employee1.email = "john.doe@swizframework.org"
			employee1.startDate = new Date();
			
			var employee2:Employee = new Employee();
			employee2.id = 2;
			employee2.firstName = "Jane"
			employee2.lastName = "Doe";
			employee2.email = "jane.doe@swizframework.org"
			employee2.startDate = new Date();
			
			var employeeList:IList = new ArrayCollection([employee1, employee2]);
			return util.createMockResult(employeeList, 500);
		}
		
		public function createEmployee(employee:Employee):AsyncToken
		{
			employee.id = 3;
			return util.createMockResult(employee, 250);
		}
		
		public function updateEmployee(employee:Employee):AsyncToken
		{
			return util.createMockResult(employee, 250);
		}
		
		public function deleteEmployee(employee:Employee):AsyncToken
		{
			return util.createMockResult(true, 250);
		}
	}
}