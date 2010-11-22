package org.swizframework.examples.modules.customers.model.presentation
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	import org.swizframework.examples.events.CustomersEvent;
	import org.swizframework.examples.modules.customers.model.CustomersModel;
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class CustomersViewPresentationModel extends EventDispatcher
	{
		// ========================================
		// system properties
		// ========================================
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var customersModel:CustomersModel;
		
		// ========================================
		// system methods
		// ========================================
		
		[PostConstruct]
		public function fetchCustomersOnStartUp():void
		{
			dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.FETCH_CUSTOMERS ) );
		}
		
		[EventHandler( "CustomersEvent.CUSTOMERS_LOADED" )]
		public function getLoadedCustomers():void
		{
			customers = customersModel.customers;
		}
		
		// ========================================
		// view support properties
		// ========================================
		
		[Bindable]
		public var customers:IList;
		
		// ========================================
		// view support methods
		// ========================================
		
		[Bindable( "selectedCustomerChanged" )]
		public function get clearSelectionEnabled():Boolean
		{
			//return customersModel.selectedCustomer != null;
			return true;
		}
		
		public function setSelectedCustomer( customer:Object ):void
		{
			dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.CUSTOMER_SELECTED, customer as Customer ) );
			
			dispatchEvent( new Event( "selectedCustomerChanged" ) );
		}
		
		public function clearSelectedCustomer():void
		{
			setSelectedCustomer( null );
		}
	}
}