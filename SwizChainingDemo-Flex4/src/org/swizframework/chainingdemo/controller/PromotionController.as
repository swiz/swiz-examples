package org.swizframework.chainingdemo.controller
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.chainingdemo.service.MockUserService;
	import org.swizframework.utils.services.ServiceHelper;
	
	public class PromotionController
	{
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[Inject]
		public var service : MockUserService;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		[Inject( source="loggingHost.activityLog", bind="true" )]
		public var log : ArrayCollection;
		
		[EventHandler( event="UserEvent.LOAD_CUSTOM_PROMOTIONS_FOR_USER" )]
		/**
		 * Load user-specific promotion data.
		 */ 
		public function loadCustomPromotions() : AsyncToken
		{
			log.addItem( "Starting a nested chain to get user and global promotions..." );
			log.addItem( "Loading User-specific promotions via an asynchronous server call..." );
			return serviceHelper.executeServiceCall( service.loadUser(), handleCustomPromotionsResult );
		}
		
		/**
		 * Handle the result of the call to load user-specific promotion data.
		 */ 
		private function handleCustomPromotionsResult( event : ResultEvent ) : void
		{
			log.addItem( "The asynchronous server call to load the user promotions is complete." );
		}
		
		[EventHandler( event="UserEvent.LOAD_PROMOTIONS_FOR_ALL_USERS" )]
		/**
		 * Load promotion data for all users (not user-specific).
		 */ 
		public function loadGlobalPromotions() : AsyncToken
		{
			log.addItem( "Loading promotions for all users via an asynchronous server call..." );
			return serviceHelper.executeServiceCall( service.loadUser(), handleGlobalPromotionsResult );
		}
		
		/**
		 * Handle the result of the call to load global promotion data.
		 */ 
		private function handleGlobalPromotionsResult( event : ResultEvent ) : void
		{
			log.addItem( "The asynchronous server call to load the global promotions is complete." );
			log.addItem( "The nested chain is finished." );
		}
		
	}
}