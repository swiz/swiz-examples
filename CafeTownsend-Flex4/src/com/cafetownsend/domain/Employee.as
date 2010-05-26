package com.cafetownsend.domain
{
	[Bindable]
	[RemoteClass("com.cafetownsend.domain.Employee")]
	public class Employee
	{
		
		public var id:Number;
		public var firstName:String;
		public var lastName:String;
		public var startDate:Date;
		public var email:String;		
		
		static public var currentIndex : int = 0;
		
		public function Employee(	id : uint =			0, 
									firstName : String =	"", 
									lastName : String =		"", 
									email : String =		"", 
									startDate : Date =		null ) 
		{
			this.id = ( id == 0 ) ?  currentIndex += 1 : id;
			this.firstName = firstName;
			this.lastName = lastName;
			this.email = email;
			this.startDate =  ( startDate == null ) ?  new Date() : startDate;
		}
		
		/**
		 * UI helper function to use as labelField
		 * @return Fullname
		 *
		 */
		public function get fullName():String
		{
			return firstName + " " + lastName;
		}
		
		
		/**
		 * UI helper function to check of empty values
		 * @return 	Boolean
		 *
		 */		
		public function isEmpty():Boolean
		{
			return 	this.firstName == '' && this.lastName == '' && this.email == '';
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		// helper methods
		//
		//--------------------------------------------------------------------------

		/**
		 * Copy all values of another employee
		 * 
		 * @param	employee	Instance of an employee, which values has to be copied
		 * 
		 */
		public function copyFrom( employee: Employee ):void 
		{
			this.id = employee.id;
			this.email = employee.email;
			this.firstName = employee.firstName;
			this.lastName = employee.lastName;
			this.startDate = new Date( Date.parse( employee.startDate ) );			
		}
		
		
		/**
		 * Clone an employee
		 * 
		 * @return 	Employee	Cloned instance of Employee
		 */
		public function clone():Employee 
		{
			var employee: Employee = new Employee();
			
			employee.id = this.id;
			employee.email = this.email;
			employee.firstName = this.firstName;
			employee.lastName = this.lastName;
			employee.startDate = new Date( Date.parse( this.startDate ) );
			
			return employee;
			
		}
	}
}