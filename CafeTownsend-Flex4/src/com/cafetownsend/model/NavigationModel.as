package com.cafetownsend.model
{
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.domain.User;
	
	public class NavigationModel
	{
		
		public static const PATH_LOGGED_OUT:String 			= "loggedOut";
		public static const PATH_LOGGED_IN:String 			= "loggedIn";
		
		public static const PATH_EMPLOYEE_LIST:String 		= PATH_LOGGED_IN + "/employeeList";
		public static const PATH_EMPLOYEE_DETAIL:String 	= PATH_LOGGED_IN + "/employeeDetail";	
		
		[Bindable]
		public var path:String = PATH_LOGGED_OUT;	

		
	}
}