package com.cafetownsend.presentation
{

	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	import com.cafetownsend.event.NavigationEvent;
	import com.cafetownsend.model.NavigationModel;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	
	
	public class EmployeeListPresentationModel extends EventDispatcher
	{
		
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		

		
		//--------------------------------------------------------------------------
		//
		// employee list
		//
		//--------------------------------------------------------------------------
		
		private var _employees:ArrayCollection = null;
		public static const EMPLOYEES_CHANGED:String = "employeesChanged";
		
		[Inject("employeeModel.employees")]
		[Bindable(Event="employeesChanged")]		
		public function set employees( list:ArrayCollection ):void
		{
			_employees = list;
			dispatchEvent( new Event( EMPLOYEES_CHANGED ) );
		}
		
		public function get employees( ):ArrayCollection
		{
			return _employees;
		}
	
		
		//--------------------------------------------------------------------------
		//
		// selected Employee
		//
		//--------------------------------------------------------------------------
			
		
		private var _selectedEmployee:Employee = null;
		
		public static const SELECTED_EMPLOYEE_CHANGED:String = "selectedEmployeeChanged";
		
		
		[Inject("employeeModel.selectedEmployee")]
		[Bindable(event="selectedEmployeeChanged")]
		public function set selectedEmployee(value:Employee):void
		{
			if ( _selectedEmployee != value ) 
			{
				_selectedEmployee = value;
				dispatchEvent( new Event( SELECTED_EMPLOYEE_CHANGED ) );
			}
		}		

		public function get selectedEmployee(): Employee
		{
			return _selectedEmployee;
		}

		
		[Bindable(Event="selectedEmployeeChanged")]
		public function get hasSelectedEmployee():Boolean
		{
			return selectedEmployee != null;
		}
		
		[Bindable(Event="selectedEmployeeChanged")]
		public function get selectedEmployeeIndex():int
		{
			if( selectedEmployee == null )
				return -1;
			
			var i:int = 0;
			var max: int = employees.length;
			var storedEmployee: Employee;
			var id: int = selectedEmployee.id;
			
			for (i; i < max; i++) 
			{
				storedEmployee = employees.getItemAt( i ) as Employee;
				
				if( storedEmployee.id == id )
					return i;
			}
			
			return -1;
		}
		
		
		//--------------------------------------------------------------------------
		//
		// public methods called by its view
		//
		//--------------------------------------------------------------------------
		
		public function selectEmployee( employee:Employee ) : void 
		{
			dispatcher.dispatchEvent( new EmployeeEvent( EmployeeEvent.SELECT, employee ) );
		}	
		
		public function createEmployee() : void 
		{
			dispatcher.dispatchEvent( new EmployeeEvent( EmployeeEvent.CREATE ) );			
		}
		
		
		public function updateEmployee() : void 
		{
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.UPDATE_PATH, NavigationModel.PATH_EMPLOYEE_DETAIL ) );			
		}
		

		public function deleteEmployee() : void 
		{
			dispatcher.dispatchEvent( new EmployeeEvent( EmployeeEvent.DELETE ) );
			
		}

		
	}
}