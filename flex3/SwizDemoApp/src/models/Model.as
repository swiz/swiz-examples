package models
{
	import mx.collections.ArrayCollection;
	
	/**
	 * Making everything bindable for convenience sake.
	 */
	[Bindable]
	public class Model
	{
		/**
		 * Simple strings.
		 */
		public var modelString:String = "Hello from the model.";
		public var inputString:String = "This is some input text. Change me.";
		
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
		public var list:ArrayCollection = new ArrayCollection( [ "Larry", "Curly", "Moe" ] );
	}
}