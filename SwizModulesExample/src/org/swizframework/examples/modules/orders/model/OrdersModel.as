package org.swizframework.examples.modules.orders.model
{
	import mx.collections.ArrayCollection;

	public class OrdersModel
	{
		[Bindable]
		public var orders:ArrayCollection;
		
		[Bindable]
		public var selectedCustomerId:String;
	}
}