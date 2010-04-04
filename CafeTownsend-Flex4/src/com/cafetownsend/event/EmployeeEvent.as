package com.cafetownsend.event
{
	import com.cafetownsend.domain.Employee;
	
	import flash.events.Event;
	
	public class EmployeeEvent extends Event
	{
		
		public static const CREATE:String = "EmployeeEvent.CREATE";
		public static const UPDATE:String = "EmployeeEvent.UPDATE";
		public static const DELETE:String = "EmployeeEvent.DELETE";
		
		private var _employee:Employee;
		
		public function get employee():Employee
		{
			return _employee;
		}
		
		public function EmployeeEvent(type:String, employee:Employee, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_employee = employee;
		}
		
		override public function clone():Event
		{
			return new EmployeeEvent(type, employee, bubbles, cancelable);
		}
	}
}