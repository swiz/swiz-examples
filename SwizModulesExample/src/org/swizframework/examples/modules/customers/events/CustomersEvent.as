package org.swizframework.examples.modules.customers.events
{
	import flash.events.Event;
	
	import org.swizframework.examples.modules.customers.model.domain.Customer;
	
	public class CustomersEvent extends Event
	{
		public static const FETCH_CUSTOMERS:String = "fetchCustomers";
		public static const CUSTOMERS_LOADED:String = "customersLoaded";
		public static const SELECTED_CUSTOMER_CHANGED:String = "selectedCustomerChanged";
		
		public var customer:Customer;
		
		public function CustomersEvent( type:String, customer:Customer = null )
		{
			super( type );
			
			this.customer = customer;
		}
		
		override public function clone():Event
		{
			return new CustomersEvent( type, customer );
		}
	}
}