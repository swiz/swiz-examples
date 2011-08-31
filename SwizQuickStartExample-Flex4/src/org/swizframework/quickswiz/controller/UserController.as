package org.swizframework.quickswiz.controller
{
	import org.swizframework.quickswiz.model.User;
	import org.swizframework.quickswiz.service.UserService;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class UserController
	{
		[Inject]
		public var userService : UserService;
		
		[Inject]
		/**
		 * Swiz will automatically create any Bean for of the built-in helper classes
		 * if one has not been defined.
		 */ 
		public var serviceHelper : ServiceHelper;
		
		[Bindable]
		public var currentUser : User;
		
		[PostConstruct]
		/**
		 * [PostConstruct] methods are invoked after all dependencies are injected.
		 * In this example, we set up a default user after the bean is created.
		 */ 
		public function createDefaultUser() : void
		{
			currentUser = new User();
		}
		
		[EventHandler( event="UserEvent.SAVE_USER_REQUESTED", properties="user" )]
		/**
		 * Perform a server request to save the user
		 */ 
		public function saveUser( user : User ) : void
		{
			serviceHelper.executeServiceCall( userService.saveUser( user ), handleSaveUserResult );
		}
		
		/**
		 * Handle the server call result
		 */ 
		private function handleSaveUserResult( event : ResultEvent ) : void
		{
			// Show an Alert just to make it obvious that the save was successful.
			Alert.show( 'User saved successfully!', 'Success' );
		}
		
	}
}