package com.cafetownsend.model
{
	import com.cafetownsend.domain.Employee;
	
	import mx.collections.IList;
	
	public class EmployeeModel
	{
		
		[Bindable]
		public var employees:IList;
		
		[Bindable]
		public var selectedEmployee:Employee;
		
	}
}