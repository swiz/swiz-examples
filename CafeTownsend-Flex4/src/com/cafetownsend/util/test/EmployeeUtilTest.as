package com.cafetownsend.util.test
{
	
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.util.EmployeeUtil;
	
	import flash.utils.ByteArray;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	
	public class EmployeeUtilTest
	{		
		
		
		[Embed( source="/assets/xml/Employees.xml", mimeType="application/octet-stream" )] 
		protected var employeesXMLBytes: Class;
		protected var employeesXML: XML;
		
		
		[Before]
		public function setUp():void
		{
			var bytes: ByteArray = new employeesXMLBytes() as ByteArray;
			employeesXML = new XML( bytes.readUTFBytes( bytes.length ) );
		}
		
		[After]
		public function tearDown():void
		{
			employeesXML = null;
		}
		

		
		[Test(description="Parsing xml data and creating employees")]
		public function parseAndCreateEmployees():void
		{
			
			
			var employee:Employee;
			var employees:Array = EmployeeUtil.getEmployeesFromXML( employeesXML );
			
			Assert.assertNotNull( "employees ", employees );
			Assert.assertTrue("employees.length ", employees.length == 4 );
			
			employee = employees[ 0 ] as Employee;
			
			Assert.assertNotNull( employee );
			Assert.assertEquals( 1, employee.id );
			Assert.assertEquals( "firstname ", "Sue", employee.firstName );
			Assert.assertEquals( "lastname ", "Hove", employee.lastName );
			Assert.assertEquals( "email ", "shove@cafetownsend.com", employee.email );
			Assert.assertEquals( "email ", "shove@cafetownsend.com", employee.email );
			Assert.assertNotNull( "startdate ", employee.startDate );

			employee = employees[ 1 ] as Employee;
			
			Assert.assertNotNull( employee );
			Assert.assertEquals( 2, employee.id );
			Assert.assertEquals( "Matt", employee.firstName );
			Assert.assertEquals( "Boles", employee.lastName );
			Assert.assertEquals( "mboles@cafetownsend.com", employee.email );
			Assert.assertNotNull( "startdate ", employee.startDate );

		}
	}
}