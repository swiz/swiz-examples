package org.swizframework.examples.modules.customers.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.customers.events.CustomersEvent;
	import org.swizframework.examples.modules.customers.model.CustomersModel;
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class CustomersViewPresentationModel
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
		
		[Mediate( "CustomersEvent.CUSTOMERS_LOADED" )]
		public function getLoadedCustomers():void
		{
			customers = customersModel.customers;
		}
		
		public function setSelectedCustomer( customer:Customer ):void
		{
			customersModel.setSelectedCustomer( customer );
		}
	}
}