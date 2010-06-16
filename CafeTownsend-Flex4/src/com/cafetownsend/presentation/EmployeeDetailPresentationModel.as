package com.cafetownsend.presentation
{
	
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.event.EmployeeEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.ValidationResultEvent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.validators.EmailValidator;
	import mx.validators.StringValidator;
	
	public class EmployeeDetailPresentationModel extends EventDispatcher
	{
		
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		private static const LOG: ILogger = Log.getLogger("EmployeeDetailPresentationModel");
		
		//--------------------------------------------------------------------------
		//
		// selected employee
		//
		//--------------------------------------------------------------------------
		
		
		private var _selectedEmployee:Employee = null;
		
		
		[Bindable]
		[Inject("employeeModel.selectedEmployee", bind="true")]
		public function get selectedEmployee( ):Employee
		{
			return _selectedEmployee;
		}

		public function set selectedEmployee( employee:Employee ):void
		{
			if( employee != null )
			{
				_selectedEmployee = employee;
				
				if( employee != null )
					tempEmployee = _selectedEmployee.clone();

			}
		}
		
		
		//--------------------------------------------------------------------------
		//
		// temp. employee
		//
		//--------------------------------------------------------------------------
		
		private var _tempEmployee:Employee = new Employee();
		
		public static const TEMP_EMPLOYEE_CHANGED:String = "tempEmployeeChanged";
		
		
		[Bindable(Event="tempEmployeeChanged")]	
		public function get tempEmployee( ):Employee
		{
			return _tempEmployee;
		}
		
		public function set tempEmployee( employee:Employee ):void
		{
			if( _tempEmployee !== employee )
			{
				_tempEmployee = employee;
				
				this.dispatchEvent( new Event( TEMP_EMPLOYEE_CHANGED ) );
				
			}
		}



		[Bindable(Event="tempEmployeeChanged")]	
		public function get selectedEmployeeCanBeDeleted( ):Boolean
		{
			return !selectedEmployee.isEmpty();
		}

		
		
		//--------------------------------------------------------------------------
		//
		// Cancel editing
		//
		//--------------------------------------------------------------------------
		
		public function cancelEmployeeEdits() : void 
		{
			clearValidationMessages();
			
			dispatcher.dispatchEvent( new EmployeeEvent( EmployeeEvent.CANCEL ) );
		}
		
		//--------------------------------------------------------------------------
		//
		// update employee
		//
		//--------------------------------------------------------------------------
		
		public function updateEmployee( ):void
		{
			if( validateEmployee( tempEmployee ) )
			{
				clearValidationMessages();
				
				var event:EmployeeEvent = new EmployeeEvent( EmployeeEvent.UPDATE, _tempEmployee.clone() );
				
				dispatcher.dispatchEvent(event);				
			}
			else
			{
				this.dispatchEvent( new Event( VALIDATION_CHANGED ) );
			}
			
		}
		
		//--------------------------------------------------------------------------
		//
		// delete employee
		//
		//--------------------------------------------------------------------------
		
		
		public function deleteEmployee() : void 
		{
			dispatcher.dispatchEvent( new EmployeeEvent( EmployeeEvent.DELETE ) );	
		}
		
		
		//--------------------------------------------------------------------------
		//
		// validation
		//
		//--------------------------------------------------------------------------
		
		
		protected var emailValidator:EmailValidator;
		protected var stringValidator:StringValidator;
		

		public function validateEmployee( employee:Employee ):Boolean
		{
			// create stringValidator if not created yet
			stringValidator ||= new StringValidator();
			
			var stringValidation: ValidationResultEvent = stringValidator.validate( employee.firstName );
			var validFirstname:Boolean = stringValidation.results == null;
			_firstNameError = ( validFirstname ) ? "" : "Please enter first name.";

			stringValidation = stringValidator.validate( employee.lastName );
			var validLastname:Boolean = stringValidation.results == null;
			_lastNameError = ( validLastname ) ? "" : "Please enter last name.";
			
			// create emailValidator if not created yet
			emailValidator ||= new EmailValidator();
			
			var emailValidation:ValidationResultEvent = emailValidator.validate( employee.email);
			var validEmail:Boolean = emailValidation.results == null;
			_emailError = ( validEmail ) ? "" : emailValidation.message;
			
			return ( validFirstname  &&  validLastname && validEmail );
		}
		
		
		public static const VALIDATION_CHANGED:String = "validationChanged";
		
		
		protected function clearValidationMessages():void 
		{
			_firstNameError
			= _lastNameError
			= _emailError
			= '';
			
			dispatchEvent( new Event( VALIDATION_CHANGED ) );
		}
		
		
		
		private var _firstNameError:String = "";
		
		[Bindable(Event="validationChanged")]
		public function get firstNameError():String
		{
			return _firstNameError;
		}
		
		
		private var _lastNameError:String = "";
		
		[Bindable(Event="validationChanged")]
		public function get lastNameError():String
		{
			return _lastNameError;
		}
		
		
		private var _emailError:String = "";
		
		[Bindable(Event="validationChanged")]
		public function get emailError():String
		{
			return _emailError;
		}

	}
}