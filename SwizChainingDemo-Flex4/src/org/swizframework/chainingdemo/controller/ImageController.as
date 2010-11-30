package org.swizframework.chainingdemo.controller
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;
	
	import org.swizframework.chainingdemo.event.UserEvent;
	import org.swizframework.utils.async.AsynchronousIOOperation;
	import org.swizframework.utils.async.IAsynchronousOperation;
	import org.swizframework.utils.chain.EventChainStep;
	import org.swizframework.utils.chain.IChain;
	import org.swizframework.utils.services.URLRequestHelper;
	
	public class ImageController
	{
		public static const VALID_USER_IMAGE_PATH : String = "images/swiz-army.png";
		public static const INVALID_USER_IMAGE_PATH : String = "images/this-image-does-not-exist.png";
		public static const DEFAULT_USER_IMAGE_PATH : String = "images/swiz-logo.png";
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[Inject( source="loggingHost.activityLog", bind="true" )]
		public var log : ArrayCollection;
		
		[Inject]
		public var urlRequestHelper : URLRequestHelper;
		
		/**
		 * For example purposes, this property holds the path to the user's image. 
		 * This is used in the URLRequest to load the appropriate image.
		 */ 
		private var targetImagePath : String;
		
		[EventHandler( event="UserEvent.LOAD_USER_IMAGE" )]
		/**
		 * Load the user's image. Since this event handler method returns an IAsynchronousOperation, 
		 * Swiz automatically knows that if the method runs as part of an event chain, it should wait 
		 * until the operation completes before proceeding to the next chain step.
		 */ 
		public function loadUserImage( event : UserEvent ) : IAsynchronousOperation
		{
			log.addItem( "Loading the user's preferred image via a URLRequest..." );
			var request : URLRequest = new URLRequest( targetImagePath );
			var loader : URLLoader = urlRequestHelper.executeURLRequest( request, handleUserImageResult, handleUserImageFailure, null, null, [event.step.chain] );
			
			// AsynchronousIOOperation can be used to wrap anything that dispatches a COMPLETE event.
			return new AsynchronousIOOperation( loader );
		}
		
		[EventHandler( event="UserEvent.LOAD_DEFAULT_USER_IMAGE" )]
		/**
		 * Load a "default" image for the user. This is an example of loading a generic image in
		 * case the call to load a user-specific image failed for some reason. 
		 * 
		 * Since this event handler method returns an IAsynchronousOperation, 
		 * Swiz automatically knows that if the method runs as part of an event chain, it should wait 
		 * until the operation completes before proceeding to the next chain step.
		 */ 
		public function loadDefaultUserImage( event : UserEvent ) : IAsynchronousOperation
		{
			log.addItem( "Loading a default user image via a URLRequest..." );
			var request : URLRequest = new URLRequest( targetImagePath );
			var loader : URLLoader = urlRequestHelper.executeURLRequest( request, handleUserImageResult, handleUserImageFailure, null, null, [event.step.chain] );
			
			// AsynchronousIOOperation can be used to wrap anything that dispatches a COMPLETE event.
			return new AsynchronousIOOperation( loader );
		}
		
		/**
		 * Handle loading the user-specific image.
		 */ 
		private function handleUserImageResult( event : Event, chain : IChain ) : void
		{
			var bytesLoaded : int = URLLoader( event.target ).bytesLoaded;
			log.addItem( "The URL request to load the image is complete (" + bytesLoaded + " bytes loaded)." );
		}
		
		/**
		 * If the user-specific image fails to load, dynamically modify the current chain
		 * to add a chain step that loads a default image instead.
		 */ 
		private function handleUserImageFailure( event : Event, chain : IChain ) : void
		{
			log.addItem( "The URL request to load the image failed. Dynamically modify the chain to request a default image..." );
			targetImagePath = DEFAULT_USER_IMAGE_PATH;
			chain.addStep( new EventChainStep( new UserEvent( UserEvent.LOAD_DEFAULT_USER_IMAGE ) ) );
			chain.doProceed();
		}
		
		[EventHandler( event="UserEvent.URL_CHAIN_REQUESTED", priority="100" )]
		/**
		 * When doing a non-dynamic chain, set this to the image that represents the user's image.
		 * This uses a high priority EventHandler to ensure that the path is set before any other
		 * event handlers execute.
		 */
		public function setValidImagePath() : void
		{
			targetImagePath = VALID_USER_IMAGE_PATH;
		}
		
		[EventHandler( event="UserEvent.DYNAMIC_URL_CHAIN_REQUESTED", priority="100" )]
		[EventHandler( event="UserEvent.LOAD_USER_REQUESTED", priority="100" )]
		/**
		 * When running a chain that will be modified dynamically, set the image to an invalid file.
		 * This uses a high priority EventHandler to ensure that the path is set before any other
		 * event handlers execute.
		 */ 
		public function setInvalidImagePath() : void
		{
			targetImagePath = INVALID_USER_IMAGE_PATH;
		}
		
	}
}