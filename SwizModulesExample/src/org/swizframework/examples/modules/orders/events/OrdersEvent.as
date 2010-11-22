package org.swizframework.examples.modules.orders.events
{
	import flash.events.Event;
	
	public class OrdersEvent extends Event
	{
		public static const FETCH_ORDERS:String = "fetchOrders";
		public static const ORDER_LIST_UPDATED:String = "orderListUpdated";
		
		public function OrdersEvent( type:String )
		{
			super( type );
		}
	}
}