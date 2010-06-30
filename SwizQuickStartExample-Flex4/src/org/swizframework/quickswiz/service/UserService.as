package org.swizframework.quickswiz.service
{
	import org.swizframework.quickswiz.model.User;
	import flash.events.IEventDispatcher;
	import mx.rpc.AsyncToken;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	
	public class UserService
	{
		[Dispatcher]
		/**
		 * The [Dispatcher] metadata tag instructs Swiz to inject an event dispatcher.
		 * Event's dispatched via this dispatcher can trigger event mediators.
		 */ 
		public var dispatcher : IEventDispatcher;
		
		/**
		 * To avoid a live server dependency, we use a Swiz
		 * helper class to let us create fake AsyncTokens
		 */ 
		private var mockHelper : MockDelegateHelper;
		
		public function UserService()
		{
			mockHelper = new MockDelegateHelper();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */ 
		public function saveUser( user : User ) : AsyncToken
		{
			user.id = Math.round( Math.random() * 100 );
			return mockHelper.createMockResult( user );
		}
	}
}