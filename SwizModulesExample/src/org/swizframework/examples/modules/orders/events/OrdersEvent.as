package org.swizframework.examples.modules.orders.events
{
	import flash.events.Event;
	
	public class OrdersEvent extends Event
	{
		public static const FETCH_ORDERS:String = "fetchOrders";
		public static const ORDERS_UPDATED:String = "ordersUpdated";
		
		public function OrdersEvent( type:String )
		{
			super( type );
		}
		
		override public function clone():Event
		{
			return new OrdersEvent( type );
		}
	}
}