package org.swizframework.examples.modules.orders.business
{
	import mx.rpc.AsyncToken;

	public interface IOrdersDelegate
	{
		function getOrders():AsyncToken;
		function getOrdersForCustomer( customerId:String ):AsyncToken;
	}
}