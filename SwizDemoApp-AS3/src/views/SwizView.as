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
			/**
			 * You provide dependencies to Swiz using IBeanProviders.
			 * Here we are defining a BeanProvider directly, which is basically just an Array.
			 * Beans can be added and removed at runtime.
			 * BeanLoader is not yet implemented in this release but will implement IBeanProvider once it is.
			 * 
			 * The Controller bean will be available for autowiring by type only.
			 * The Model bean will be available for autowiring by name as well as type.
			 */
			bp = new BeanProvider( [ new Controller(), new Bean( new Model(), "appModel" ) ] );
			
			/**
			 * Support for custom metadata processors is probably the coolest feature in Swiz 1.0.0
			 * Definitely check out their source to see how easy they are to implement.
			 * Swiz uses this exact mechanism to implement its built in metadata tags like Autowire, Mediate and VirtualBean.
			 */
			cp = [ new ClockProcessor(), new RandomProcessor() ];
			
			/**
			 * Create an instance of Swiz and pass in dependencies and custom processors.
			 * SwizConfig is not yet implemented in this release but will be soon.
			 */
			swiz = new Swiz( this, null, [ bp ], cp );
			// manually intialize Swiz. this is done automatically when defining Swiz in MXML.
			swiz.init();
			
			// a sample view used to show Swiz functionality.
			addChild( new MainView() );
		}
	}
}