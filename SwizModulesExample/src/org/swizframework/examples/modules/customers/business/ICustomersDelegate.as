package org.swizframework.examples.modules.customers.business
{
	import mx.rpc.AsyncToken;

	public interface ICustomersDelegate
	{
		function getCustomers():AsyncToken;
	}
}