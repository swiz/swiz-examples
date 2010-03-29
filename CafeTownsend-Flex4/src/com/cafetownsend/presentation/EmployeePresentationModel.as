package com.cafetownsend.presentation
{
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	public class EmployeePresentationModel
	{
		
		[Bindable]
		[Inject("employeeModel.currentState")]
		public var currentState:String;
		
		[Bindable]
		[Inject("employeeModel.employees")]
		public var employees:IList;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function EmployeePresentationModel()
		{
		}
		
		public function createEmployee(firstName:String, lastName:String, startDate:Date, email:String):void
		{
			var employee:Employee = new Employee();
			employee.firstName = firstName;
			employee.lastName = lastName;
			employee.startDate = new Date();
			employee.email = email;
			dispatcher.dispatchEvent(new EmployeeEvent(EmployeeEvent.CREATE, employee));
		}
		
		public function deleteEmployee(employee:Employee):void
		{
			dispatcher.dispatchEvent(new EmployeeEvent(EmployeeEvent.DELETE, employee));
		}
	}
}