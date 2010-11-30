package org.swizframework.chainingdemo.event
{
	import org.swizframework.utils.async.AsynchronousEvent;
	
	public class UserEvent extends AsynchronousEvent
	{
		// CONSTANTS ///////////////////////////////////////////////////////////////////////////////////////////////////////// //
		
		/**
		 * Start a simple event chain.
		 */ 
		public static const SIMPLE_CHAIN_REQUESTED : String = "UserEvent.SIMPLE_CHAIN_REQUESTED";
		
		/**
		 * Start a chain that does simulates an asynchronous server call.
		 */ 
		public static const ASYNC_CHAIN_REQUESTED : String = "UserEvent.ASYNC_CHAIN_REQUESTED";
		
		/**
		 * Start a chain that includes a nested event chain.
		 */ 
		public static const NESTED_CHAIN_REQUESTED : String = "UserEvent.NESTED_CHAIN_REQUESTED";
		
		/**
		 * Start a chain that performs a URL reqeust.
		 */ 
		public static const URL_CHAIN_REQUESTED : String = "UserEvent.URL_CHAIN_REQUESTED";
		
		/**
		 * Start a chain that dynamically modifies a chain while it is running.
		 */ 
		public static const DYNAMIC_URL_CHAIN_REQUESTED : String = "UserEvent.DYNAMIC_URL_CHAIN_REQUESTED";
		
		/**
		 * Start a complex command chain that demonstrates a number of chaining features together.
		 */ 
		public static const LOAD_USER_REQUESTED : String = "UserEvent.LOAD_USER_REQUESTED";
		
		/**
		 * A simple event to announce that the user screen is active and doing something.
		 */ 
		public static const USER_SCREEN_ACTIVE : String = "UserEvent.USER_SCREEN_ACTIVE";
		
		/**
		 * A simple event to announce that any user-related processing that was running is finished.
		 */ 
		public static const USER_PROCESSING_COMPLETE : String = "UserEvent.USER_PROCESSING_COMPLETE";
		
		/**
		 * Get the User from the server.
		 */ 
		public static const LOAD_USER : String = "UserEvent.LOAD_USER";
		
		/**
		 * Load user-specific and global Promotions.
		 * These will run in their own Chain.
		 */ 
		public static const LOAD_CUSTOM_PROMOTIONS_FOR_USER : String = "UserEvent.LOAD_CUSTOM_PROMOTIONS_FOR_USER";
		public static const LOAD_PROMOTIONS_FOR_ALL_USERS : String = "UserEvent.LOAD_PROMOTIONS_FOR_ALL_USERS";
		
		/**
		 * Load the user's profile image.
		 */
		public static const LOAD_USER_IMAGE : String = "UserEvent.LOAD_USER_IMAGE";
		
		/**
		 * Get a default profile image if the user-specific image can't be loaded for some reason.
		 */ 
		public static const LOAD_DEFAULT_USER_IMAGE : String = "UserEvent.LOAD_DEFAULT_USER_IMAGE";
		
		
		// CONSTRUCTOR ///////////////////////////////////////////////////////////////////////////////////////////////////////// //
		
		public function UserEvent( type : String )
		{
			super( type, true, false );
		}
	}
}