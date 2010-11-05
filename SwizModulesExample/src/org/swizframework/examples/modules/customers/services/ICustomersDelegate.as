package org.swizframework.examples.modules.customers.services
{
	import mx.rpc.AsyncToken;

	public interface ICustomersDelegate
	{
		function getCustomers():AsyncToken;
	}
}