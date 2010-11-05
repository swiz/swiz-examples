package org.swizframework.examples.modules.orders.services
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.rpc.AsyncToken;
	
	import org.swizframework.examples.modules.orders.model.domain.Order;
	import org.swizframework.utils.services.MockDelegateHelper;

	public class MockOrdersDelegate implements IOrdersDelegate
	{
		[Inject]
		public var mdh:MockDelegateHelper;
		
		public function getOrders():AsyncToken
		{
			return mdh.createMockResult( getFakeOrders(), 250 );
		}
		
		private function getFakeOrders():ArrayCollection
		{
			var orders:ArrayCollection = new ArrayCollection();
			
			orders.addItem( new Order( "001", "AAA", 100, 54.98 ) );
			orders.addItem( new Order( "002", "AAA", 540, 29.37 ) );
			orders.addItem( new Order( "003", "BBB", 100, 41.72 ) );
			orders.addItem( new Order( "004", "CCC", 230, 33.82 ) );
			orders.addItem( new Order( "005", "DDD", 100, 90.14 ) );
			orders.addItem( new Order( "006", "AAA", 725, 36.75 ) );
			orders.addItem( new Order( "007", "EEE", 325, 12.67 ) );
			orders.addItem( new Order( "008", "CCC", 500, 84.05 ) );
			orders.addItem( new Order( "009", "CCC", 100, 89.24 ) );
			orders.addItem( new Order( "010", "DDD", 475, 62.76 ) );
			
			return orders;
		}
	}
}