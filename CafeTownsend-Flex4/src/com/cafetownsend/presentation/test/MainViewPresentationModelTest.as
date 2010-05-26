package com.cafetownsend.presentation.test
{
	import com.cafetownsend.event.LoginEvent;
	import com.cafetownsend.model.NavigationModel;
	import com.cafetownsend.presentation.MainViewPresentationModel;
	
	import flash.events.EventDispatcher;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class MainViewPresentationModelTest
	{		
		protected var pm: MainViewPresentationModel;
		
		
		//--------------------------------------------------------------------------
		//
		// setup
		//
		//--------------------------------------------------------------------------
		
		[Before]
		public function setUp():void
		{
			pm = new MainViewPresentationModel();
			pm.dispatcher = new EventDispatcher();
		}
		
		[After]
		public function tearDown():void
		{
			pm.dispatcher = null;
			pm = null;
		}
		
		//--------------------------------------------------------------------------
		//
		// test
		//
		//--------------------------------------------------------------------------
		
		[Test( description="Change view state when navigationPath was changed")]
		public function changeCurrentState():void
		{
			
			pm.currentState = NavigationModel.PATH_LOGGED_IN;
			
			Assert.assertEquals("currentState has to be set using first path value of NavigationModel.PATH_EMPLOYEE_DETAIL", 
				pm.currentState, 
				"loggedIn"  
			);
			
		}
		
		
		//--------------------------------------------------------------------------
		//
		// test bindings and application events
		//
		//--------------------------------------------------------------------------
		
		
		[Test( async, description="Trigger CURRENT_STATE_CHANGED if currentState is changed")]
		public function triggerViewStateChanged():void
		{
			Async.proceedOnEvent( 	this, 
									pm, 
									MainViewPresentationModel.CURRENT_STATE_CHANGED, 
									200, 
									eventNeverDispatched );
			
			pm.currentState = NavigationModel.PATH_LOGGED_IN;		
			
		}
		
		[Test( async, description="Dispatch LoginEvent.LOGOUT trying logout")]
		public function logout():void
		{
			Async.proceedOnEvent( 	this, 
									pm.dispatcher, 
									LoginEvent.LOGOUT, 
									200, 
									eventNeverDispatched );
			
			pm.logout();		
			
		}
		
		//--------------------------------------------------------------------------
		//
		// helper method
		//
		//--------------------------------------------------------------------------
		
		
		protected function eventNeverDispatched( passThroughData:Object ):void 
		{
			Assert.fail( 'Event is not dispatched');
		}
	}
}