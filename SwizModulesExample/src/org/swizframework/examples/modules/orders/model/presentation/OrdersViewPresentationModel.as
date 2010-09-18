package org.swizframework.examples.modules.orders.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.orders.events.OrdersEvent;

	public class OrdersViewPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		[Inject( "ordersModel.orders", bind="true" )]
		public var orders:ArrayCollection;
		
		[PostConstruct]
		public function fetchOrdersOnStartUp():void
		{
			dispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.FETCH_ORDERS ) );
		}
	}
}