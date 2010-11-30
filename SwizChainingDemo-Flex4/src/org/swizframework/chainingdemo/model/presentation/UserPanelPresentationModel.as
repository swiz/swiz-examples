package org.swizframework.chainingdemo.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;
	
	import org.swizframework.chainingdemo.event.UserEvent;
	import org.swizframework.chainingdemo.model.domain.LoggingHost;
	import org.swizframework.chainingdemo.view.ChainingDemoOverviewPopUp;

	public class UserPanelPresentationModel
	{
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[Bindable]
		[Inject]
		public var loggingHost : LoggingHost;
		
		/**
		 * Trigger a simple event chain.
		 */ 
		public function doSimpleChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.SIMPLE_CHAIN_REQUESTED ) );
		}
		
		/**
		 * Trigger a chain that simulates an asynchronous server call.
		 */ 
		public function doAsyncChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.ASYNC_CHAIN_REQUESTED ) );
		}
		
		/**
		 * Trigger a chain that includes a nested event chain.
		 */ 
		public function doNestedChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.NESTED_CHAIN_REQUESTED ) );
		}
		
		/**
		 * Trigger a chain that performs a URL reqeust.
		 */ 
		public function doURLChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.URL_CHAIN_REQUESTED ) );
		}
		
		/**
		 * Trigger a chain that is dynamically modified while it is running.
		 */ 
		public function doDynamicURLChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.DYNAMIC_URL_CHAIN_REQUESTED ) );
		}
		
		/**
		 * Trigger a complex chain that includes all of the previous chaining concepts.
		 */ 
		public function doComplexChain() : void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.LOAD_USER_REQUESTED ) );
		}
		
		/**
		 * Show the initial PopUp that simply lists some of the things this example will demonstrate.
		 */ 
		public function showOverviewPopUp( target : UIComponent ) : void
		{
			ChainingDemoOverviewPopUp.createPopUp( target );
		}
		
		
	}
}