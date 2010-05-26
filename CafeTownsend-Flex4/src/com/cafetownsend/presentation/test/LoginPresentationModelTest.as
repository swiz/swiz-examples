package com.cafetownsend.presentation.test
{
	import com.cafetownsend.domain.User;
	import com.cafetownsend.event.LoginEvent;
	import com.cafetownsend.presentation.LoginPresentationModel;
	
	import flash.events.EventDispatcher;
	
	import flexunit.framework.Assert;
	
	import mx.rpc.Fault;
	
	import org.flexunit.async.Async;

	public class LoginPresentationModelTest
	{		
		protected var pm: LoginPresentationModel;

		
		//--------------------------------------------------------------------------
		//
		// setup
		//
		//--------------------------------------------------------------------------
		
		
		[Before]
		public function setUp():void
		{
			pm = new LoginPresentationModel();
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
		
		
		[Test]
		public function handleLoginPending():void 
		{
			pm.loginPending = true;
			
			//
			// simulate and test login error
			pm.handleLoginError( new Fault('anyFaultCode', 'anyFaultString') );
			Assert.assertFalse('loginPending is fault', pm.loginPending );
			
			//
			// simulate and test login complete
			pm.handleLoginComplete( new LoginEvent( LoginEvent.COMPLETE ) );
			Assert.assertFalse('loginPending is fault', pm.loginPending );	
			
		}
		
		[Test]
		public function changeCurrentState():void 
		{
			//
			// test currentState trying to login
			pm.login('Luke', 'Skywalker');			
			Assert.assertEquals('current state', 
								LoginPresentationModel.STATE_DEFAULT, 
								pm.currentState );
			//
			// test currentState if login failed
			pm.handleLoginError( new Fault('anyFaultCode', 'anyFaultString') );		
			Assert.assertEquals('current state', LoginPresentationModel.STATE_ERROR, pm.currentState );
			
		}

		[Test]
		public function handlingLoginData():void 
		{
			//
			// test invalid data
			var valid: Boolean = pm.validLoginData('','');			
			Assert.assertFalse('invalid login data', valid );
			Assert.assertTrue('userNameError String', pm.usernameError.length > 0 );
			Assert.assertTrue('passwordError String', pm.passwordError.length > 0 );
			//
			// test valid data
			valid = pm.validLoginData('Luke','Skywalker');			
			Assert.assertTrue('login data', valid );
			Assert.assertFalse('userNameError String', pm.usernameError.length );
			Assert.assertFalse('passwordError String', pm.passwordError.length );
			
		}
		
		//--------------------------------------------------------------------------
		//
		// dispatching application events
		//
		//--------------------------------------------------------------------------	
		
		[Test( async, description="Dispatching LoginEvent.LOGIN to inform controller to try login")]
		public function dispatchLoginEvent():void 
		{

			var passThroughData:Object = {};
			passThroughData.username = "Luke Skywalker";
			passThroughData.password = "secretPW123";

			Async.handleEvent( this,
								pm.dispatcher,
								LoginEvent.LOGIN,
								loginEventHandler,
								200,
								passThroughData,
								handleEventNeverOccurred );
			
			pm.login( passThroughData.username, passThroughData.password);
			
			
		}
		
		protected function loginEventHandler( event: LoginEvent, passThroughData:Object ):void 
		{
			//
			// check event
			Assert.assertNotNull( "LoginEvent", event );
			
			//
			// check event data
			var user:User = event.user;
			
			Assert.assertNotNull( "User", user );
			Assert.assertEquals("username", passThroughData.username, user.username );
			Assert.assertEquals("passwort", passThroughData.password, user.password );
			
		}
		
		//--------------------------------------------------------------------------
		//
		// helper method
		//
		//--------------------------------------------------------------------------
		

		protected function handleEventNeverOccurred( passThroughData:Object = null ):void 
		{
			Assert.fail( 'Event is not dispatched');
		}
		

		
		
	}
}