package org.swizframework.examples.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.swizframework.examples.events.ApplicationEvent;
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class ApplicationModel extends EventDispatcher
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		protected var _selectedCustomer:Customer;
		
		[Bindable( "selectedCustomerChanged" )]
		public function get selectedCustomer():Customer
		{
			return _selectedCustomer;
		}
		
		public function setSelectedCustomer( customer:Customer ):void
		{
			_selectedCustomer = customer;
			
			dispatcher.dispatchEvent( new ApplicationEvent( ApplicationEvent.CURRENT_CUSTOMER_CHANGED ) );
			
			dispatchEvent( new Event( "selectedCustomerChanged" ) );
		}
	}
}