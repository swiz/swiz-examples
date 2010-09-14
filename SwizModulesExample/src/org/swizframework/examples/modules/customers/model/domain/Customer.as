package org.swizframework.examples.modules.customers.model.domain
{
	[RemoteClass( alias="org.swizframework.examples.modules.customers.model.domain.Customer" )]
	public class Customer
	{
		public var customerId:String;
		public var customerName:String;
		public var customerLocation:String;
		
		public function Customer( customerId:String = null, customerName:String = null, customerLocation:String = null )
		{
			this.customerId = customerId;
			this.customerName = customerName;
			this.customerLocation = customerLocation;
		}
	}
}