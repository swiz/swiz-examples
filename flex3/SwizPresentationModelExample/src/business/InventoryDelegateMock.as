package business
{
	import models.vo.Product;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.swizframework.util.TestUtil;
	
	public class InventoryDelegateMock implements IInventoryDelegate
	{
		[Autowire( bean="inventoryService" )]
		public var inventoryService:RemoteObject;
		
		public function InventoryDelegateMock()
		{
		}
		
		public function fetchInventory():AsyncToken
		{
			var items:ArrayCollection = new ArrayCollection();
			
			var p1:Product = new Product();
			p1.name = "Swizzle Sticks";
			p1.qty = 100;
			p1.price = 1.99;
			items.addItem( p1 );
			
			var p2:Product = new Product();
			p2.name = "Swiz Cheese";
			p2.qty = 15;
			p2.price = 3.49;
			items.addItem( p2 );
			
			var p3:Product = new Product();
			p3.name = "Swiz Training";
			p3.qty = 50;
			p3.price = 9.99;
			items.addItem( p3 );
			
			return TestUtil.mockResult( items, 1000 );
		}
	}
}