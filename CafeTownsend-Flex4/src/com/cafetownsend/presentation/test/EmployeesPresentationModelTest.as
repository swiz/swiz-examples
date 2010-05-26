package com.cafetownsend.presentation.test
{
	import com.cafetownsend.model.NavigationModel;
	import com.cafetownsend.presentation.EmployeesPresentationModel;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class EmployeesPresentationModelTest
	{		
		protected var pm: EmployeesPresentationModel;
		
		
		//--------------------------------------------------------------------------
		//
		// setup
		//
		//--------------------------------------------------------------------------
		
		[Before]
		public function setUp():void
		{
			pm = new EmployeesPresentationModel();
		}
		
		[After]
		public function tearDown():void
		{
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
			
			pm.currentState = NavigationModel.PATH_EMPLOYEE_DETAIL;
			
			Assert.assertEquals("currentState has to be set using  second path value of NavigationModel.PATH_EMPLOYEE_DETAIL", 
				pm.currentState, 
				"employeeDetail"  
			);
			
		}
		
		
		//--------------------------------------------------------------------------
		//
		// test bindings
		//
		//--------------------------------------------------------------------------
		
		
		[Test( async, description="Trigger CURRENT_STATE_CHANGED if currentState is changed")]
		public function triggerViewStateChanged():void
		{
			Async.proceedOnEvent( this, pm, EmployeesPresentationModel.CURRENT_STATE_CHANGED, 200, bindingNeverOccurred );
			
			pm.currentState = NavigationModel.PATH_EMPLOYEE_DETAIL;		
			
		}
		
		protected function bindingNeverOccurred( passThroughData:Object ):void 
		{
			Assert.fail( 'Bindings are not triggered');
		}
		
	}
}