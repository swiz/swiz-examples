package com.cafetownsend.presentation
{
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	public class EmployeePresentationModel
	{
		public static const STATE_DEFAULT:String = "default";
		public static const STATE_UPDATE:String = "update";
		public static const STATE_ADD:String = "add";
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		[Inject("employeeModel.employees")]
		public var employees:IList;
		
		[Bindable]
		public var currentState:String = STATE_DEFAULT;
		
		[Bindable]
		public var selectedEmployee:Employee;
		
		[Bindable]
		public var selectedEmployeeIndex:int = -1;
		
		public function EmployeePresentationModel()
		{
		}
		
		public function selectEmployee(index:int):void
		{
			selectedEmployeeIndex = index;
			if( index != -1 )
			{
				selectedEmployee = employees.getItemAt(index) as Employee;
			}
			else
			{
				selectedEmployee = null;
			}
			currentState = selectedEmployee != null ? STATE_UPDATE : STATE_DEFAULT;
		}
		
		public function addEmployee():void
		{
			selectedEmployeeIndex = -1;
			selectedEmployee = new Employee();
			currentState = STATE_ADD;
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
		
		public function updateEmployee(firstName:String, lastName:String, startDate:Date, email:String):void
		{
			var employee:Employee = selectedEmployee;
			employee.firstName = firstName;
			employee.lastName = lastName;
			employee.startDate = new Date();
			employee.email = email;
			dispatcher.dispatchEvent(new EmployeeEvent(EmployeeEvent.UPDATE, employee));
		}
		
		public function deleteEmployee():void
		{
			var employee:Employee = selectedEmployee;
			dispatcher.dispatchEvent(new EmployeeEvent(EmployeeEvent.DELETE, employee));
			selectEmployee(-1);
			currentState = STATE_DEFAULT;
		}
	}
}