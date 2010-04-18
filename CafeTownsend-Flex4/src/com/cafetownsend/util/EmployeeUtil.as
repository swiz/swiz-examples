package com.cafetownsend.util
{
	import com.cafetownsend.domain.Employee;
	
	public final class EmployeeUtil
	{
		
		
		public static function getEmployeesFromXML( xml:XML ):Array 
		{
			var employees:Array = [];
				
			for each( var data: XML in xml..employee ) 
			{
				var employee:Employee = new Employee();
				employee.email = data.email;
				employee.id = data.emp_id;
				employee.firstName = data.firstname;
				employee.lastName = data.lastname;
				employee.startDate = new Date( Date.parse( data.startdate ) );
			
				employees.push( employee );
			}
			
			return employees;
		}

	}
}