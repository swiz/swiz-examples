package models
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Event( name="activeViewChanged", type="flash.events.Event" )]
	
	public class ApplicationModel extends EventDispatcher
	{
		public static const SALES_VIEW:int = 0;
		public static const EMPLOYEE_VIEW:int = 1;
		public static const INVENTORY_VIEW:int = 2;
		
		/**
		 * Backing variable for <code>activeView</code> getter/setter.
		 */
		protected var _activeView:int = EMPLOYEE_VIEW;
		
		[Bindable( "activeViewChanged" )]
		/**
		 * 
		 */
		public function get activeView():int
		{
			return _activeView;
		}
		
		public function set activeView( value:int ):void
		{
			_activeView = value;
			dispatchEvent( new Event( "activeViewChanged" ) );
		}
		
		[Bindable]
		public var employees:ArrayCollection;
		
		public function ApplicationModel()
		{
			employees = new ArrayCollection();
			employees.addItem( new Employee( 1, "Ben Clinkinbeard", "Taylor Mill, KY" ) );
			employees.addItem( new Employee( 2, "Chris Scott", "Philadelphia, PA" ) );
			employees.addItem( new Employee( 3, "Sönke Rohde", "São Paulo, Brazil" ) );
		}
	}
}