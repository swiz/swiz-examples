package com.cafetownsend.controller
{
	import com.cafetownsend.model.NavigationModel;

	
	public class NavigationController
	{
		[Inject]
		public var model: NavigationModel;

		
		
		//--------------------------------------------------------------------------
		//
		// view state handling
		//
		//--------------------------------------------------------------------------
		
		
		[Mediate(event="NavigationEvent.UPDATE_PATH",properties="path")]
		public function changeStateHandler( path: String ):void
		{
			model.path = path;
		}

		[Mediate(event="LoginEvent.COMPLETE")]
		public function loggInCompleteHandler():void
		{
			model.path = NavigationModel.PATH_LOGGED_IN;
		}
		

	}
}