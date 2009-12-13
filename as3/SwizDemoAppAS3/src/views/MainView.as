package views
{
	import fl.data.DataProvider;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import models.Model;
	
	/**
	 * This is a class-level metadata tag and works a lot like mx:Binding tags in Flex.
	 * Keeps you from having to create a public var just to set a child from it.
	 * Dot notation in source shows accessing a deeply nested property.
	 */
	[Autowire( source="appModel.subModel.subModelString", destination="subModelLabel.text" )]

	public class MainView extends MainView_Symbol
	{
		protected var _model:Model;
		
		[Autowire( "appModel" )]
		public function set model( value:Model ):void
		{
			_model = value;
			_model.addEventListener( "modelStringChanged", handleModelStringChange );
			
			_model.addEventListener( "inputStringChanged", handleInputStringChange );
			
			label.text = _model.modelString;
			inputLabel.text = ti.text = _model.inputString;
		}
		
		private function handleModelStringChange( e:Event ):void
		{
			label.text = _model.modelString;
		}
		
		private function handleInputStringChange( e:Event ):void
		{
			inputLabel.text = _model.inputString;
		}
		
		[Clock]
		public function set clockTime( value:String ):void
		{
			clockLabel.text = "Current time is " + value;
		}
		
		[Random]
		public function set randomText( value:String ):void
		{
			randomLabel.htmlText = "processors.RandomProcessor generated <b>" + value + "</b>";
		}
		
		/**
		 * Remember personList actually maps to a property on Model that was decorated with [VirtualBean( name="personList" )].
		 */
		[Autowire( "personList" )]
		public function set personList( value:Array ):void
		{
			myList.dataProvider = new DataProvider( value );
		}
		
		public function MainView()
		{
			super();
			
			btn.addEventListener( MouseEvent.CLICK, handleClick );
			ti.addEventListener( Event.CHANGE, handleTextInputChange );
		}
		
		protected function handleClick( event:MouseEvent ):void
		{
			dispatchEvent( new Event( "testEvent", true, true ) );
		}
		
		protected function handleTextInputChange( event:Event ):void
		{
			_model.inputString = ti.text;
		}
	}
}