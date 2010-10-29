package com.cafetownsend.controller
{
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	import com.cafetownsend.event.NavigationEvent;
	import com.cafetownsend.model.EmployeeModel;
	import com.cafetownsend.model.NavigationModel;
	import com.cafetownsend.service.IEmployeeDelegate;
	import com.cafetownsend.util.EmployeeUtil;
	import com.cafetownsend.util.ErrorUtil;
	
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class EmployeeController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		
		[Inject]
		public var model:EmployeeModel;
		
		[Inject]
		public var delegate:IEmployeeDelegate;
		
		[Inject]
		public var serviceRequestUtil:ServiceHelper;
		
		public function EmployeeController()
		{
		}
		
		//--------------------------------------------------------------------------
		//
		// Loading employees
		//
		//--------------------------------------------------------------------------
		
		[EventHandler(event="LoginEvent.COMPLETE")]
		public function loadEmployees():void
		{
			var call:AsyncToken = delegate.loadEmployees();
			serviceRequestUtil.executeServiceCall(call, loadEmployeeHandler);
		}
		
		protected function loadEmployeeHandler(event:ResultEvent):void
		{
			var call:AsyncToken = delegate.loadEmployees();
			serviceRequestUtil.executeServiceCall( call, loadEmployeesResultHandler );
			
		}
		
		
		protected function loadEmployeesResultHandler(event: ResultEvent ):void 
		{
			var xml: XML;
			
			try {
				xml = event.result as XML;
			}
			catch( error: Error )
			{
				ErrorUtil.showError( 'Unable to get loaded data of employees: ' + error.message );
				return;
			}

			
			var employees: Array = EmployeeUtil.getEmployeesFromXML( xml );
			
			model.employees = new ArrayCollection( employees );
			
		}

		//--------------------------------------------------------------------------
		//
		// Create employee
		//
		//--------------------------------------------------------------------------
		
		
		[EventHandler(event="EmployeeEvent.CREATE")]
		public function createEmployee():void
		{
			var employee: Employee = new Employee();
			
			model.selectedEmployee = employee;
			
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.UPDATE_PATH, NavigationModel.PATH_EMPLOYEE_DETAIL ) );
			
		}

		//--------------------------------------------------------------------------
		//
		// Update employee
		//
		//--------------------------------------------------------------------------
		

		[EventHandler(event="EmployeeEvent.UPDATE",properties="employee")]
		public function updateEmployee( employee: Employee ):void
		{
			var call:AsyncToken = delegate.updateEmployee( employee );
			serviceRequestUtil.executeServiceCall(call, updateEmployeeResultHandler);
		}
		
		protected function updateEmployeeResultHandler( event: ResultEvent ):void
		{
			var updatedEmployee: Employee;			
			
			try {
				updatedEmployee = event.result as Employee;
			}
			catch( error: Error )
			{
				ErrorUtil.showError( error.message );
				return;
			}
			
			var employee: Employee;	
			var employees: IList = model.employees;
			var employeesIndex: int = -1;
			
			var i:int = 0;
			var max: int = employees.length;
			
			for (i; i < max; i++) 
			{
				employee = employees.getItemAt( i ) as Employee;
				
				if( employee.id == updatedEmployee.id )
				{
					employeesIndex = i;
					break;
				}
			}

			if ( employeesIndex > -1 ) 
			{
				model.selectedEmployee = model.employees.getItemAt( employeesIndex ).copyFrom( updatedEmployee ) as Employee; 
			}
			else 
			{
				model.selectedEmployee = model.employees.addItem( updatedEmployee ) as Employee;
			}						
			
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.UPDATE_PATH, NavigationModel.PATH_EMPLOYEE_LIST ) );
		}
		
		//--------------------------------------------------------------------------
		//
		// Delete employee
		//
		//--------------------------------------------------------------------------
		
		
		[EventHandler(event="EmployeeEvent.DELETE")]
		public function deleteEmployee( ) : void 
		{
			var employee: Employee = model.selectedEmployee;
			
			Alert.show(	'Are you sure you want to delete "' + employee.firstName + ' ' +  employee.lastName + '"?',
				null,
				Alert.OK | Alert.CANCEL,
				FlexGlobals.topLevelApplication as Sprite,
				checkForDeletingEmployee,
				null,
				Alert.OK );
		}
		
		
		protected function checkForDeletingEmployee ( event: CloseEvent ):void 
		{
			// was the Alert event an OK
			if ( event.detail == Alert.OK ) 
				deleteEmployeeHandler();
		}
		
		
		public function deleteEmployeeHandler():void
		{
			var call:AsyncToken = delegate.deleteEmployee( model.selectedEmployee );
			serviceRequestUtil.executeServiceCall( call, deleteEmployeeResultHandler );

		}
		

		
		protected function deleteEmployeeResultHandler(event:ResultEvent):void
		{
			var deletedEmployee: Employee;			
			
			try {
				deletedEmployee = event.result as Employee;
			}
			catch( error: Error )
			{
				ErrorUtil.showError( error.message );
				return;
			}
			
			var employee: Employee;
			
			var employees: IList = model.employees;
			
			var i:int = 0;
			var max: int = employees.length;
			
			for (i; i < max; i++) 
			{
				employee = employees.getItemAt( i ) as Employee;
				
				if( employee.id == deletedEmployee.id )
				{
					employees.removeItemAt( i );	
					break;
				}
			}
			
			model.selectedEmployee = null;
			
			//
			// change view state back to employee list
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.UPDATE_PATH, NavigationModel.PATH_EMPLOYEE_LIST ) );
		}

		

		//--------------------------------------------------------------------------
		//
		// select employee
		//
		//--------------------------------------------------------------------------
		
		[EventHandler(event="EmployeeEvent.SELECT", properties="employee")]
		public function selectEmployee(employee:Employee):void
		{
			model.selectedEmployee = employee;
		}
	
		
		//--------------------------------------------------------------------------
		//
		// Cancel editing employee
		//
		//--------------------------------------------------------------------------
		
		[EventHandler(event="EmployeeEvent.CANCEL")]
		public function cancelEditingEmployee( event:EmployeeEvent ):void
		{
			model.selectedEmployee = null;
			
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.UPDATE_PATH, NavigationModel.PATH_EMPLOYEE_LIST ) );
		}
	
	}
}