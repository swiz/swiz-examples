package org.swizframework.chainingdemo.controller
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.chainingdemo.event.UserEvent;
	import org.swizframework.chainingdemo.model.domain.LoggingHost;
	import org.swizframework.chainingdemo.service.MockUserService;
	import org.swizframework.events.ChainEvent;
	import org.swizframework.utils.chain.EventChain;
	import org.swizframework.utils.chain.EventChainStep;
	import org.swizframework.utils.services.ServiceHelper;

	public class UserController
	{
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[Inject]
		public var service : MockUserService;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		[Inject]
		public var loggingHost : LoggingHost;
		
		[EventHandler( event="UserEvent.SIMPLE_CHAIN_REQUESTED" )]
		/**
		 * Run a simple event chain.
		 */
		public function doSimpleChain() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting simple event chain..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.ASYNC_CHAIN_REQUESTED" )]
		/**
		 * Run a chain that simulates an asynchronous server call.
		 */ 
		public function doAsyncChain() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting an event chain with asynchronous server calls..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER ) ) );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.NESTED_CHAIN_REQUESTED" )]
		/**
		 * Run a chain that includes a nested event chain.
		 */ 
		public function doNestedChains() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting a chain containing a nested chain..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER ) ) );
			
			// The events to load the user and global promotion data are part of a separate chain.
			var userPromotionsChain : EventChain = new EventChain( dispatcher );
			userPromotionsChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_CUSTOM_PROMOTIONS_FOR_USER ) ) );
			userPromotionsChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_PROMOTIONS_FOR_ALL_USERS ) ) );
			
			// The child chain is added the parent chain just like any other chain step.
			eventChain.addStep( userPromotionsChain );
			
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.URL_CHAIN_REQUESTED" )]
		/**
		 * Run a chain that performs a URL reqeust.
		 */ 
		public function doURLRequestChain() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting url request chain..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			
			var userImageChain : EventChain = new EventChain( dispatcher );
			userImageChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER_IMAGE ) ) );
			eventChain.addStep( userImageChain );
			
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.DYNAMIC_URL_CHAIN_REQUESTED" )]
		/**
		 * Run a chain that is dynamically modified while it is running.
		 */ 
		public function doURLRequestDynamicChain() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting a chain that will be altered dynamically while running..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			
			var userImageChain : EventChain = new EventChain( dispatcher );
			userImageChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER_IMAGE ) ) );
			eventChain.addStep( userImageChain );
			
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.LOAD_USER_REQUESTED" )]
		/**
		 * Run a complex chain that includes all of the previous chaining concepts.
		 */ 
		public function doComplexChains() : void
		{
			loggingHost.resetLogs();
			loggingHost.activityLog.addItem( "Starting a complex chain combining previous features..." );
			
			var eventChain : EventChain = new EventChain( dispatcher );
			eventChain.addEventListener( ChainEvent.CHAIN_COMPLETE, handleChainComplete, false, 0, true );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_SCREEN_ACTIVE ) ) );
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER ) ) );
			
			var userPromotionsChain : EventChain = new EventChain( dispatcher );
			userPromotionsChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_CUSTOM_PROMOTIONS_FOR_USER ) ) );
			userPromotionsChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_PROMOTIONS_FOR_ALL_USERS ) ) );
			eventChain.addStep( userPromotionsChain );
			
			var userImageChain : EventChain = new EventChain( dispatcher );
			userImageChain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_USER_IMAGE ) ) );
			eventChain.addStep( userImageChain );
			
			eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.USER_PROCESSING_COMPLETE ) ) );
			
			eventChain.start();
		}
		
		[EventHandler( event="UserEvent.USER_SCREEN_ACTIVE" )]
		public function logUserScreenActive() : void
		{
			loggingHost.activityLog.addItem( "The user screen has begun some activity." );
		}
		
		[EventHandler( event="UserEvent.USER_PROCESSING_COMPLETE" )]
		public function logUserProcessingComplete() : void
		{
			loggingHost.activityLog.addItem( "The user screen activity is complete." );
		}
		
		[EventHandler( event="UserEvent.LOAD_USER" )]
		/**
		 * Since this event handler method returns an AsyncToken, Swiz automatically knows that
		 * if the method runs as part of an event chain, it should wait until the asyncronous call 
		 * completes before proceeding to the next chain step.
		 */ 
		public function loadUser() : AsyncToken
		{
			loggingHost.activityLog.addItem( "Loading a User via an asynchronous server call..." );
			return serviceHelper.executeServiceCall( service.loadUser(), handleUserLoadResult );
		}
		
		private function handleUserLoadResult( event : ResultEvent ) : void
		{
			loggingHost.activityLog.addItem( "The asynchronous server call to load the user is complete." );
		}
		
		public function handleChainComplete( event : Event ) : void
		{
			loggingHost.activityLog.addItem( "The chain has completed successfully." );
		}
		
	}
}