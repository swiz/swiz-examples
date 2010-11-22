package org.swizframework.examples.modules.customers.services
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class CustomersDelegate implements ICustomersDelegate
	{
		[Inject( "customersService" )]
		public var customersService:RemoteObject;
		
		public function getCustomers():AsyncToken
		{
			return customersService.getCustomers();
		}
	}
}