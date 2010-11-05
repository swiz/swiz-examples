package org.swizframework.examples.modules.orders.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.orders.events.OrdersEvent;

	public class OrdersModel extends EventDispatcher
	{
		[Dispatcher( "local" )]
		public var localDispatcher:IEventDispatcher;
		
		//
		// orders
		//
		
		protected var _orders:ArrayCollection;
		
		[Bindable( "ordersChanged" )]
		public function get orders():ArrayCollection
		{
			return _orders;
		}
		
		public function setOrders( value:ArrayCollection ):void
		{
			if( _orders == value )
				return;
			
			_orders = value;
			dispatchEvent( new Event( "ordersChanged" ) );
			
			localDispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.ORDER_LIST_UPDATED ) );
		}
	}
}