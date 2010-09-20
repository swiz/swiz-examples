package org.swizframework.examples.modules.orders.business
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class OrdersDelegate implements IOrdersDelegate
	{
		[Inject( "ordersService" )]
		public var ordersService:RemoteObject;
		
		public function getOrders():AsyncToken
		{
			return ordersService.getOrders();
		}
	}
}