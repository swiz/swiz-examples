package org.swizframework.examples.modules.customers.control
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.customers.business.ICustomersDelegate;
	import org.swizframework.examples.modules.customers.events.CustomersEvent;
	import org.swizframework.examples.modules.customers.model.CustomersModel;
	import org.swizframework.utils.services.ServiceHelper;

	public class CustomersController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var delegate:ICustomersDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var customersModel:CustomersModel;
		
		[Mediate( "CustomersEvent.FETCH_CUSTOMERS" )]
		public function getCustomers():void
		{
			serviceHelper.executeServiceCall( delegate.getCustomers(), getCustomers_result, getCustomers_fault );
		}
		
		protected function getCustomers_result( data:Object ):void
		{
			customersModel.customers = data.result as ArrayCollection;
			
			dispatcher.dispatchEvent( new CustomersEvent( CustomersEvent.CUSTOMERS_LOADED ) );
		}
		
		protected function getCustomers_fault( info:Object ):void
		{
			// handle fault
		}
	}
}