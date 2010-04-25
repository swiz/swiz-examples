package com.cafetownsend.presentation.test
{
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.presentation.EmployeeListPresentationModel;
	import com.cafetownsend.util.EmployeeFactory;
	
	import flash.events.EventDispatcher;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;
	
	import org.flexunit.async.Async;

	public class EmployeeListPresentationModelTest
	{		
		
		protected var pm:EmployeeListPresentationModel;
		
		
		//--------------------------------------------------------------------------
		//
		// setup
		//
		//--------------------------------------------------------------------------
		
		[Before]
		public function setUp():void
		{
			pm = new EmployeeListPresentationModel();
			pm.dispatcher = new EventDispatcher();
		}
		
		[After]
		public function tearDown():void
		{
			pm = null;
		}

		//--------------------------------------------------------------------------
		//
		// test
		//
		//--------------------------------------------------------------------------
		
		[Test(description="Index of selected employee")]
		public function selectedEmployeeIndex():void 
		{
			// create employee list
			pm.employees = new ArrayCollection( EmployeeFactory.createEmployeeList( 20 ) );
			//
			// grab employee from list at index = 5
			var index: int = 5;
			var selectedEmployee: Employee = pm.employees.getItemAt( index ) as Employee;
			// set it as selected employee
			pm.selectedEmployee = selectedEmployee;
			// check selectedEmployeeIndex
			Assert.assertEquals( index, pm.selectedEmployeeIndex );
			
		}
		
		[Test]
		public function hasSelectedEmployee():void 
		{
			pm.selectedEmployee = EmployeeFactory.createEmployee();
			
			Assert.assertTrue( pm.hasSelectedEmployee );
			
		}
		
		
		//--------------------------------------------------------------------------
		//
		// test bindings
		//
		//--------------------------------------------------------------------------
		
		[Test(async,description="Trigger selectedEmployeeChanged")]
		public function triggerSelectedEmployeeChanged():void 
		{
			Async.proceedOnEvent( 	this, 
									pm, 
									EmployeeListPresentationModel.SELECTED_EMPLOYEE_CHANGED, 
									200, 
									dispatchingEventNeverOccurred );
			
			// trigger SELECTED_EMPLOYEE_CHANGED
			pm.selectedEmployee = EmployeeFactory.createEmployee();
		}
		
		
		protected function dispatchingEventNeverOccurred( passThroughData:Object ):void 
		{
			Assert.fail('Bindings are not triggered');
		}
		
		
	}
}