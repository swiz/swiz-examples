package org.swizframework.examples.modules.orders.control
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.model.ApplicationModel;
	import org.swizframework.examples.modules.orders.services.IOrdersDelegate;
	import org.swizframework.examples.modules.orders.events.OrdersEvent;
	import org.swizframework.examples.modules.orders.model.OrdersModel;
	import org.swizframework.examples.modules.orders.model.domain.Order;
	import org.swizframework.utils.services.ServiceHelper;

	public class OrdersController
	{
		[Dispatcher( "local" )]
		public var localDispatcher:IEventDispatcher;
		
		[Inject]
		public var delegate:IOrdersDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var ordersModel:OrdersModel;
		
		[Inject]
		public var appModel:ApplicationModel;
		
		[EventHandler( "OrdersEvent.FETCH_ORDERS", scope="local" )]
		public function getOrders():void
		{
			serviceHelper.executeServiceCall( delegate.getOrders(), getOrders_result, getOrders_fault );
		}
		
		protected function getOrders_result( data:Object ):void
		{
			ordersModel.setOrders( data.result as ArrayCollection );
		}
		
		protected function getOrders_fault( info:Object ):void
		{
			// handle fault
		}
		
		[EventHandler( "ApplicationEvent.CURRENT_CUSTOMER_CHANGED" )]
		public function filterOrders():void
		{
			ordersModel.orders.filterFunction = ( appModel.selectedCustomer ) ? filterBySelectedCustomer : null;
			ordersModel.orders.refresh();
			
			localDispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.ORDER_LIST_UPDATED ) );
		}
		
		private function filterBySelectedCustomer( item:Object ):Boolean
		{
			return Order( item ).customerId == appModel.selectedCustomer.customerId;
		}
	}
}