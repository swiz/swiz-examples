package {
	import beanProviders.AnimalBeanProvider;
	import beanProviders.ShapeBeanProvider;
	
	import flash.display.Sprite;
	
	import org.swizframework.Swiz;

	public class SkinnySwizClient extends Sprite
	{
		public function SkinnySwizClient()
		{
			var s:Swiz = new Swiz( this );
			s.addBeanProviders( [ ShapeBeanProvider ] );
		}
	}
}
