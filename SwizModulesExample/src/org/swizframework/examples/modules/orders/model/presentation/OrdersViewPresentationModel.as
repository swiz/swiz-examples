package org.swizframework.examples.modules.orders.model.presentation
{
	import flash.debugger.enterDebugger;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.orders.model.OrdersModel;

	public class OrdersViewPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		[Inject( "ordersModel.orders", bind="true" )]
		public var orders:ArrayCollection;
	}
}