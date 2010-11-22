package org.swizframework.examples.modules.customers.model
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	import org.swizframework.examples.events.CustomersEvent;

	public class CustomersModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		//
		// customers
		//
		
		protected var _customers:IList;
		
		public function get customers():IList
		{
			return _customers;
		}
		
		public function setCustomers( customers:IList ):void
		{
			_customers = customers;
			
			dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.CUSTOMERS_LOADED ) );
		}
	}
}