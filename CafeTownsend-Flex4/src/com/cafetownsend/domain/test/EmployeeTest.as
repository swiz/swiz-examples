package com.cafetownsend.domain.test
{

	
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.util.EmployeeFactory;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;


	public class EmployeeTest
	{	
		
		protected var employee: Employee;
		

		[Before]
		public function setUp():void
		{
			employee = EmployeeFactory.createEmployee();
		}
		
		[After]
		public function tearDown():void
		{
			employee = null;
		}
		
		[Test]
		public function copyEmployee():void 
		{

			var employeeCopied: Employee = new Employee()
			employeeCopied.copyFrom( employee );
			
			Assert.assertEquals("id ", employee.id, employeeCopied.id );
			Assert.assertEquals("email ", employee.email, employeeCopied.email );
			Assert.assertEquals("firstname ", employee.firstName, employeeCopied.firstName );
			Assert.assertEquals("lastname ", employee.lastName, employeeCopied.lastName );
			Assert.assertEquals("startdate ", employee.startDate.toDateString(), employeeCopied.startDate.toDateString() );
		}


		[Test]
		public function cloneEmployee():void 
		{

			var employeeCloned: Employee = employee.clone();
			
			Assert.assertEquals("id ", employee.id, employeeCloned.id );
			Assert.assertEquals("email ", employee.email, employeeCloned.email );
			Assert.assertEquals("firstname ", employee.firstName, employeeCloned.firstName );
			Assert.assertEquals("lastname ", employee.lastName, employeeCloned.lastName );
			Assert.assertEquals("startdate ", employee.startDate.toDateString(), employeeCloned.startDate.toDateString() );
		}

		[Test]
		public function employessFullName():void 
		{

			employee.firstName = "Luke";
			employee.lastName = "Skywalker";
			
			Assert.assertEquals("id ", "Luke Skywalker", employee.fullName );

		}

		[Test]
		public function employeeIsEmpty():void 
		{
			
			Assert.assertFalse( employee.isEmpty() );
			
			employee.email = '';
			employee.lastName = '';
			employee.firstName = '';
			
			Assert.assertTrue( employee.isEmpty() );
		}
	
	}
}