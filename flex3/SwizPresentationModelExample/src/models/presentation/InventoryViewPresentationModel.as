package models.presentation
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import models.vo.Product;
	
	import mx.collections.ArrayCollection;

	public class InventoryViewPresentationModel extends EventDispatcher
	{
		public function InventoryViewPresentationModel()
		{
			
		}
		
		/**
		 * Inject the employees property of ApplicationModel into this field.
		 */
		[Autowire( bean="appModel", property="inventory" )]
		[Bindable]
		public var inventory:ArrayCollection;
		
		
		// ========================================
		// selectedProduct property (read only)
		// ========================================
		
		/**
		 * @private
		 * 
		 * Backing variable for read-only <code>selectedProduct</code> getter.
		 */
		private var _selectedProduct:Product;
		
		[Bindable( "selectedProductChanged" )]
		public function get selectedProduct():Product
		{
			return _selectedProduct;
		}
		
		// setter method
		public function setSelectedProduct( value:Object ):void
		{
			if ( _selectedProduct != value )
			{
				_selectedProduct = value as Product;
				dispatchEvent( new Event( "selectedProductChanged" ) );
			}
		}
		
		/**
		 * Views using this model could obviously check selectedEmployee != null themselves.
		 * However, one of the main points of using presentation model is for your views
		 * to know as little as possible about the underlying model, and creating an explicit
		 * property is good encapsulation.
		 */
		[Bindable( "selectedProductChanged" )]
		public function get isFormVisible():Boolean
		{
			return selectedProduct != null;
		}
	}
}