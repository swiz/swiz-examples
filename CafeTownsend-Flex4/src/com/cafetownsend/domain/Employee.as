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
		
		/**
		 * UI helper function to use as labelField
		 * @return Fullname
		 *
		 */
		public function get fullName():String
		{
			return firstName + " " + lastName;
		}
		
		public function Employee()
		{
		}
	}
}