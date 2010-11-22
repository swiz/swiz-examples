package org.swizframework.examples.modules.customers.control
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.events.CustomersEvent;
	import org.swizframework.examples.modules.customers.model.CustomersModel;
	import org.swizframework.examples.modules.customers.services.ICustomersDelegate;
	import org.swizframework.utils.services.IServiceHelper;

	public class CustomersController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var delegate:ICustomersDelegate;
		
		[Inject]
		public var serviceHelper:IServiceHelper;
		
		[Inject]
		public var customersModel:CustomersModel;
		
		[EventHandler( "CustomersEvent.FETCH_CUSTOMERS" )]
		public function getCustomers():void
		{
			serviceHelper.executeServiceCall( delegate.getCustomers(), getCustomers_result, getCustomers_fault );
		}
		
		protected function getCustomers_result( data:Object ):void
		{
			customersModel.setCustomers( data.result as ArrayCollection );
		}
		
		protected function getCustomers_fault( info:Object ):void
		{
			// handle fault
		}
	}
}