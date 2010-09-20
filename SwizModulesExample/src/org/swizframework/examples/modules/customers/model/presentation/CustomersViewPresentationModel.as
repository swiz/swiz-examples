package org.swizframework.examples.modules.customers.model.presentation
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.events.CustomersEvent;
	import org.swizframework.examples.modules.customers.model.CustomersModel;
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class CustomersViewPresentationModel extends EventDispatcher
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var customersModel:CustomersModel;
		
		[PostConstruct]
		public function fetchCustomersOnStartUp():void
		{
			dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.FETCH_CUSTOMERS ) );
		}
		
		[Bindable]
		public var customers:ArrayCollection;
		
		[Bindable( "selectedCustomerChanged" )]
		public function get clearSelectionEnabled():Boolean
		{
			//return customersModel.selectedCustomer != null;
			return true;
		}
		
		[Mediate( "CustomersEvent.CUSTOMERS_LOADED" )]
		public function getLoadedCustomers():void
		{
			customers = customersModel.customers;
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