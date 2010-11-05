package org.swizframework.examples.modules.orders.services
{
	import mx.rpc.AsyncToken;

	public interface IOrdersDelegate
	{
		function getOrders():AsyncToken;
	}
}