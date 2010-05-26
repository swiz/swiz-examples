package com.cafetownsend.model
{
	
	
	public class NavigationModel
	{
		
		/**
		 * Application path using by views to set its current view states 
		 * An current application path is defined by constants located below
		 * 
		 */		
		[Bindable]
		public var path:String = PATH_LOGGED_OUT;	

		
		public static const PATH_LOGGED_OUT:String 			= "loggedOut";
		public static const PATH_LOGGED_IN:String 			= "loggedIn";
		
		public static const PATH_EMPLOYEE_LIST:String 		= PATH_LOGGED_IN + "/employeeList";
		public static const PATH_EMPLOYEE_DETAIL:String 	= PATH_LOGGED_IN + "/employeeDetail";	
		
	}
}