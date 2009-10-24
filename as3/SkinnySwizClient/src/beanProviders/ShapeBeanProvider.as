package beanProviders
{
	import views.shapes.CircleView;
	import views.shapes.RectView;
	
	public class ShapeBeanProvider
	{
		public var myCircleBean:CircleView = new CircleView();
		//public var myOtherCircleBean:CircleView = new CircleView();
		//public var myRectBean:RectView = new RectView();
		
		public function get readOnlyBean():RectView
		{
			return new RectView();
		}
		
		/**
		 * Backing variable for <code>getterSetterBean</code> getter/setter.
		 */
		protected var _getterSetterBean:RectView;
		
		public function get getterSetterBean():RectView
		{
			return _getterSetterBean;
		}
		
		public function set getterSetterBean( value:RectView ):void
		{
			_getterSetterBean = value;
		}
		
		public function ShapeBeanProvider()
		{
			super();
		}
	}
}