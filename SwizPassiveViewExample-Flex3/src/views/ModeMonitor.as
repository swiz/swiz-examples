package views
{
	import flash.events.Event;
	
	import mx.controls.Label;

	public class ModeMonitor extends Label
	{
		/**
		 * @private
		 * 
		 * Backing variable for <code>activeView</code> getter/setter.
		 */
		private var _activeView:int;
		
		/**
		 * The Autowire metadata states that Swiz should inject the activeView property from its appModel
		 * bean into this property. Since this property and the source property (ApplicationModel::activeView)
		 * are both marked Bindable, Swiz will create a binding between them to ensure changes in
		 * ApplicationModel will be propagated to this component.
		 */
		[Autowire( bean="appModel", property="activeView" )]
		[Bindable( event="activeViewChanged" )]
		public function get activeView():int
		{
			return _activeView;
		}
		
		public function set activeView( value:int ):void
		{
			_activeView = value;
			dispatchEvent( new Event( "activeViewChanged" ) );
			
			// update label based on new value
			switch( _activeView )
			{
				case 0:
					htmlText = "Now viewing <b>Sales</b>";
					break;
				
				case 1:
					htmlText = "Now viewing <b>Employees</b>";
					break;
				
				case 2:
					htmlText = "Now viewing <b>Inventory</b>";
					break;
				
				default:
					htmlText = "UNKNOWN MODE";
			}
		}
		
		public function ModeMonitor()
		{
			super();
			setStyle( "fontSize", 18 );
		}
	}
}