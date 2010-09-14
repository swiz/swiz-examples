package org.swizframework.examples.modules.customers.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.customers.model.domain.Customer;
	import org.swizframework.examples.modules.orders.events.OrdersEvent;

	public class CustomersModel extends EventDispatcher
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var customers:ArrayCollection;
		
		protected var _selectedCustomer:Customer;
		
		[Bindable( "selectedCustomerChanged" )]
		public function get selectedCustomer():Customer
		{
			return _selectedCustomer;
		}
		
		public function setSelectedCustomer( customer:Customer ):void
		{
			_selectedCustomer = customer;
			
			dispatchEvent( new Event( "selectedCustomerChanged" ) );
			
			//dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.SELECTED_CUSTOMER_CHANGED, _selectedCustomer ) );
			dispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.FETCH_ORDERS, _selectedCustomer.customerId ) );
		}
	}
}