package controllers
{
	import business.IInventoryDelegate;
	
	import flash.events.Event;
	
	import models.ApplicationModel;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.controller.AbstractController;
	
	public class InventoryController extends AbstractController
	{
		[Autowire]
		/**
		 * Main model for the application.
		 */
		public var appModel:ApplicationModel;
		
		[Autowire]
		/**
		 * Delegate used for making remote calls.
		 */
		public var delegate:IInventoryDelegate;
		
		public function InventoryController()
		{
		}
		
		[Mediate( event="show", view="InventoryView" )]
		public function loadInventoryDataForView():void
		{
			trace( "loadInventoryDataForView()" );
			executeServiceCall( delegate.fetchInventory(), fetchInventory_result );
		}
		
		protected function fetchInventory_result( event:ResultEvent ):void
		{
			appModel.inventory = event.result as ArrayCollection;
		}
	}
}