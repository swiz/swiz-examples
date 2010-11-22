package org.swizframework.examples.modules.orders.model.presentation
{
	import org.swizframework.examples.modules.orders.model.OrdersModel;
	import org.swizframework.examples.modules.orders.model.domain.Order;

	public class OrderStatsViewPresentationModel
	{
		[Inject]
		public var ordersModel:OrdersModel;
		
		[Bindable]
		public var isCalculateButtonEnabled:Boolean = true;
		
		[Bindable]
		public var orderCount:int;
		
		[Bindable]
		public var totalCostOfOrders:Number;
		
		[EventHandler( "OrdersEvent.ORDER_LIST_UPDATED", scope="local" )]
		public function handleOrderListUpdate():void
		{
			isCalculateButtonEnabled = true;
		}
		
		public function calculateTotals():void
		{
			orderCount = ordersModel.orders.length;
			totalCostOfOrders = 0;
			for each( var order:Order in ordersModel.orders )
			{
				totalCostOfOrders += order.orderPrice;
			}
			
			isCalculateButtonEnabled = false;
		}
	}
}