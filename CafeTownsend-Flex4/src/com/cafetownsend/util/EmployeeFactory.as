package com.cafetownsend.util
{
	import com.cafetownsend.domain.Employee;

	
	/**
	 * 
	 * Factory to create mock data for using unit tests only
	 * 
	 **/
	public class EmployeeFactory
	{
		/**
		 * Helper method (factory) to create an Employee object
		 * 
		 */
		public static function createEmployee(id: int = 1):Employee
		{
			var employee: Employee = new Employee( id );
			//
			// add simple mock data 
			employee.email = "email_" + id + '@cafetownswend.com';
			employee.firstName = "firstName_" + id;
			employee.lastName = "lastName_" + id;
			employee.startDate = new Date();
			return employee;			
		}

		/**
		 * Helper method (factory) to create an invalid Employee object
		 * 
		 */
		public static function createInvalidEmployee():Employee 
		{
			var employee: Employee = new Employee();
			return employee;			
		}
		
		/**
		 * Helper method (factory) to create a list of Employee object
		 * 
		 */
		public static function createEmployeeList(max: int = 10):Array 
		{
			var i:int = 0;
			var employee: Employee;
			var employees: Array = [];
			
			for ( i; i < max; i++ ) 
			{
				employee = createEmployee( i + 1 );
				employees.push( employee );				
			}
			
			return employees;			
		}
	}
}