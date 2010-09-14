package org.swizframework.examples.modules.customers.events
{
	import flash.events.Event;
	
	public class CustomersEvent extends Event
	{
		public static const FETCH_CUSTOMERS:String = "fetchCustomers";
		public static const CUSTOMERS_LOADED:String = "customersLoaded";
		
		public function CustomersEvent( type:String )
		{
			super( type );
		}
	}
}