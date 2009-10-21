package business
{
	import mx.rpc.remoting.RemoteObject;
	
	public class InventoryDelegate implements IInventoryDelegate
	{
		[Autowire( bean="inventoryService" )]
		public var inventoryService:RemoteObject;
		
		public function InventoryDelegate()
		{
		}
		
		public function fetchInventory():void
		{
			return inventoryService.fetchInventoryItems();
		}
	}
}