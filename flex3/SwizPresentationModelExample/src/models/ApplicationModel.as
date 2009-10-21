package models
{
	import mx.collections.ArrayCollection;
	
	public class ApplicationModel
	{
		public static const SALES_VIEW:int = 0;
		public static const EMPLOYEE_VIEW:int = 1;
		public static const INVENTORY_VIEW:int = 2;
		
		[Bindable]
		public var activeView:int = EMPLOYEE_VIEW;
		
		[Bindable]
		public var employees:ArrayCollection;
		
		[Bindable]
		public var inventory:ArrayCollection;
		
		public function ApplicationModel()
		{
			employees = new ArrayCollection();
			employees.addItem( new Employee( 1, "Ben Clinkinbeard", "Taylor Mill, KY" ) );
			employees.addItem( new Employee( 2, "Chris Scott", "Philadelphia, PA" ) );
			employees.addItem( new Employee( 3, "Sönke Rohde", "São Paulo, Brazil" ) );
		}
	}
}