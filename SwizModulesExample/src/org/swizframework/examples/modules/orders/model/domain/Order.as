package org.swizframework.examples.modules.orders.model.domain
{
	[RemoteClass( alias="org.swizframework.examples.modules.orders.model.domain.Order" )]
	public class Order
	{
		public var orderId:String;
		public var customerId:String;
		public var orderQty:int;
		public var orderPrice:Number;
		
		public function Order( orderId:String = null, customerId:String = null, orderQty:int = NaN, orderPrice:Number = NaN )
		{
			this.orderId = orderId;
			this.customerId = customerId;
			this.orderQty = orderQty;
			this.orderPrice = orderPrice;
		}
	}
}