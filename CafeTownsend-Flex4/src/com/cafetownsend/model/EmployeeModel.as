package com.cafetownsend.model
{
	import mx.collections.IList;
	
	public class EmployeeModel
	{
		
		public static const STATE_DEFAULT:String = "default";
		public static const STATE_DETAIL:String = "detail";
		public static const STATE_ADD:String = "add";
		
		[Bindable]
		public var currentState:String = STATE_DEFAULT;
		
		[Bindable]
		public var employees:IList;
		
		public function EmployeeModel()
		{
		}
	}
}