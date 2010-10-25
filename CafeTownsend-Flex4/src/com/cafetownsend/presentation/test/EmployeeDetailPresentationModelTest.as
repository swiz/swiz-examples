package com.cafetownsend.presentation.test
{

	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	import com.cafetownsend.presentation.EmployeeDetailPresentationModel;
	import com.cafetownsend.util.EmployeeFactory;
	
	import flash.events.EventDispatcher;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	
	
	public class EmployeeDetailPresentationModelTest
	{		
		protected var pm:EmployeeDetailPresentationModel;
		
		protected var employee:Employee;
		
		
		//--------------------------------------------------------------------------
		//
		// setup
		//
		//--------------------------------------------------------------------------
		
		[Before]
		public function setUp():void
		{
			pm = new EmployeeDetailPresentationModel();
			pm.dispatcher = new EventDispatcher();
			
			employee = EmployeeFactory.createEmployee(); 
		}
		
		[After]
		public function tearDown():void
		{
			pm = null;
		}
		
		
		//--------------------------------------------------------------------------
		//
		// temporary employee
		//
		//--------------------------------------------------------------------------
		
		
		[Test( description="Create a temporary employee")]
		public function tempEmployeeIsCreated():void 
		{
			employee.id = 200;
			
			pm.selectedEmployee = employee;			
			
			Assert.assertNotNull("tempEmployee is not null", pm.tempEmployee );
			Assert.assertTrue("tempEmployee !== selectedEmployee ", pm.tempEmployee !== pm.selectedEmployee );
			Assert.assertEquals("id ", pm.selectedEmployee.id, pm.tempEmployee.id );
			Assert.assertEquals("id ", 200, pm.tempEmployee.id );
			
		}


		//--------------------------------------------------------------------------
		//
		// validating employee
		//
		//--------------------------------------------------------------------------
		
		
		[Test( description="Validating first name of an employee and change error string")]
		public function validateEmployeesFirstNameAndUpdateErrorString():void 
		{

			Assert.assertTrue("Employees first name is valid", pm.validateEmployee( employee ) );
			Assert.assertFalse("error string is empty", pm.firstNameError.length );
			
			employee.firstName = '';
			
			Assert.assertFalse("Employees first name is invalid", pm.validateEmployee( employee ) );
			Assert.assertTrue("error string is not empty", pm.firstNameError.length );
	
			
		}

		[Test( description="Validating last name of an employee and change error string")]
		public function validateEmployeesLastNameAndUpdateErrorString():void 
		{

			Assert.assertTrue("Employees last name is valid", pm.validateEmployee( employee ) );
			Assert.assertFalse("error string is empty", pm.lastNameError.length );
			
			employee.lastName = '';
			
			Assert.assertFalse("Employees last name is invalid", pm.validateEmployee( employee ) );
			Assert.assertTrue("error string is not empty", pm.lastNameError.length );
	
			
		}

		[Test( description="Validating email of an employee and change error string")]
		public function validateEmployeesEmailAndUpdateErrorString():void 
		{

			Assert.assertTrue("Employees email is valid", pm.validateEmployee( employee ) );
			Assert.assertFalse("error string is empty", pm.emailError.length );
			
			employee.email = 'test@';
			
			Assert.assertFalse("Employees email is invalid", pm.validateEmployee( employee ) );
			Assert.assertTrue("error string is not empty", pm.emailError.length );
	
			
		}
		
		//--------------------------------------------------------------------------
		//
		// test bindings
		//
		//--------------------------------------------------------------------------
		
		
		[Test( async, description="Trigger TEMP_EMPLOYEE_CHANGED if a new employee is selected")]
		public function triggerTempEmployeeChanged():void 
		{
			Async.proceedOnEvent( 	this, 
									pm, 
									EmployeeDetailPresentationModel.TEMP_EMPLOYEE_CHANGED, 
									200, 
									dispatchingEventNeverOccurred );

			// trigger TEMP_EMPLOYEE_CHANGED
			pm.selectedEmployee = employee;
			
		}

		[Test( async, description="Trigger VALIDATION_CHANGED trying to update an invalid employee")]
		public function triggerValidationChanged():void 
		{
			//
			// check if VALIDATION_CHANGED will be fired
			Async.proceedOnEvent( 	this, 
									pm, 
									EmployeeDetailPresentationModel.VALIDATION_CHANGED,
									200, 
									dispatchingEventNeverOccurred );
			
			//
			// change created employee to an empty (invalid) employee
			employee.firstName
			= employee.lastName 
			= employee.email
			= '';
			
			pm.selectedEmployee = employee;
			//
			// and trigger VALIDATION_CHANGED
			pm.updateEmployee();

		}

		//--------------------------------------------------------------------------
		//
		// dispatching application events
		//
		//--------------------------------------------------------------------------
		
		
		
		[Test( async, description="Dispatching EmployeeEvent.DELETE to delete an employee")]
		public function dispatchDeleteEvent():void 
		{
			Async.proceedOnEvent( 	this, 
									pm.dispatcher, 
									EmployeeEvent.DELETE, 
									200, 
									dispatchingEventNeverOccurred );
			pm.deleteEmployee();

		}

		[Test( async, description="Dispatching EmployeeEvent.CANCEL to delete an employee")]
		public function dispatchCancelEvent():void 
		{
			Async.proceedOnEvent( 	this, 
									pm.dispatcher, 
									EmployeeEvent.CANCEL, 
									200, 
									dispatchingEventNeverOccurred );

			pm.cancelEmployeeEdits();

		}

		[Test( async, description="Dispatching EmployeeEvent.UPDATE to delete an employee")]
		public function dispatchUpdateEvent():void 
		{
			
			pm.selectedEmployee = employee;
			
			Async.proceedOnEvent( 	this, 
									pm.dispatcher, 
									EmployeeEvent.UPDATE, 
									200, 
									dispatchingEventNeverOccurred );

			pm.updateEmployee();

		}
		
		//--------------------------------------------------------------------------
		//
		// helper methods
		//
		//--------------------------------------------------------------------------
		
		protected function dispatchingEventNeverOccurred( passThroughData:Object ):void 
		{
			Assert.fail( 'event is not dispatched');
		}
		
		
	}
}