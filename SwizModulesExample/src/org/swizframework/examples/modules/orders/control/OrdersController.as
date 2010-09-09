package org.swizframework.examples.modules.orders.control
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.examples.modules.orders.business.IOrdersDelegate;
	import org.swizframework.examples.modules.orders.events.OrdersEvent;
	import org.swizframework.examples.modules.orders.model.OrdersModel;
	import org.swizframework.utils.services.ServiceHelper;

	public class OrdersController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var delegate:IOrdersDelegate;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var ordersModel:OrdersModel;
		
		[Mediate( "OrdersEvent.FETCH_ORDERS", properties="customerId" )]
		public function getOrders( customerId:String = null ):void
		{
			if( customerId )
				serviceHelper.executeServiceCall( delegate.getOrdersForCustomer( customerId ), getOrdersForCustomer_result, getOrders_fault, [ customerId ] );
			else
				serviceHelper.executeServiceCall( delegate.getOrders(), getOrders_result, getOrders_fault );
		}
		
		protected function getOrdersForCustomer_result( data:Object, customerId:String ):void
		{
			ordersModel.orders = data.result as ArrayCollection;
			ordersModel.selectedCustomerId = customerId;
			
			dispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.ORDERS_UPDATED ) );
		}
		
		protected function getOrders_result( data:Object ):void
		{
			ordersModel.orders = data.result as ArrayCollection;
			ordersModel.selectedCustomerId = null;
			
			dispatcher.dispatchEvent( new OrdersEvent( OrdersEvent.ORDERS_UPDATED ) );
		}
		
		protected function getOrders_fault( info:Object ):void
		{
			// handle fault
		}
	}
}