package org.swizframework.examples.control
{
	import org.swizframework.examples.events.CustomersEvent;
	import org.swizframework.examples.model.ApplicationModel;
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class ApplicationController
	{
		[Inject]
		public var appModel:ApplicationModel;
		
		[EventHandler( "CustomersEvent.CUSTOMER_SELECTED" )]
		public function handleCustomerSelection( event:CustomersEvent ):void
		{
			appModel.setSelectedCustomer( event.customer );
		}
	}
}