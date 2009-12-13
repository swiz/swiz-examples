package views
{
	import controllers.Controller;
	
	import flash.display.Sprite;
	
	import models.Model;
	
	import org.swizframework.core.Bean;
	import org.swizframework.core.BeanProvider;
	import org.swizframework.core.Swiz;
	
	import processors.ClockProcessor;
	import processors.RandomProcessor;

	public class SwizView extends Sprite
	{
		protected var swiz:Swiz;
		protected var bp:BeanProvider;
		protected var cp:Array;
		
		public function SwizView()
		{
			bp = new BeanProvider( [ new Controller(), new Bean( new Model(), "appModel" ) ] );
			cp = [ new ClockProcessor(), new RandomProcessor() ];
			
			swiz = new Swiz( this, null, [ bp ], cp );
			swiz.init();
			
			addChild( new MainView() );
		}
	}
}