package models.presentation
{
	import mx.collections.ArrayCollection;
	
	public interface IEmployeeViewPresentationModel
	{
		[Bindable( event="employeesChanged" )]
		function get employees():ArrayCollection;
		function set employees( value:ArrayCollection ):void;
		
		[Bindable( "selectedEmployeeChanged" )]
		function get selectedEmployee():Object;
		function setSelectedEmployee( value:Object ):void;
		
		function get isFormVisible():Boolean;
		
		function saveUser( user:Object ):void;
	}
}