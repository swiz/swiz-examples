package models
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{
		/**
		 * Backing variable for <code>modelString</code> getter/setter.
		 */
		protected var _modelString:String = "Hello from the model.";
		
		[Bindable( "modelStringChanged" )]
		/**
		 * 
		 */
		public function get modelString():String
		{
			return _modelString;
		}
		
		public function set modelString( value:String ):void
		{
			_modelString = value;
			dispatchEvent( new Event( "modelStringChanged" ) );
		}
		
		/**
		 * Backing variable for <code>inputString</code> getter/setter.
		 */
		protected var _inputString:String = "This is some input text. Change me.";
		
		[Bindable( "inputStringChanged" )]
		/**
		 * 
		 */
		public function get inputString():String
		{
			return _inputString;
		}
		
		public function set inputString( value:String ):void
		{
			_inputString = value;
			dispatchEvent( new Event( "inputStringChanged" ) );
		}
		
		/**
		 * Child model to illustrate support for deep dot notation in [Autowire] tags.
		 */
		public var subModel:SubModel = new SubModel();
		
		/**
		 * This is pretty cool.
		 * The VirtualBean tag allows you to designate a property as a bean.
		 * This syntax creates a named bean, but if the type were unique it could be autowired by type.
		 * This is preferable to embedding property names in [Autowire] tags.
		 */
		[VirtualBean( name="personList" )]
		public var list:Array = [ "Larry", "Curly", "Moe" ];
	}
}