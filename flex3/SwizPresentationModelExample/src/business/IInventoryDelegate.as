package business
{
	import mx.rpc.AsyncToken;
	
	public interface IInventoryDelegate
	{
		function fetchInventory():AsyncToken;
	}
}