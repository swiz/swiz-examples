package org.swizframework.examples.modules.customers.model
{
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.customers.model.domain.Customer;

	public class CustomersModel
	{
		[Bindable]
		public var customers:ArrayCollection;
		
		[Bindable]
		public var selectedCustomer:Customer;
	}
}