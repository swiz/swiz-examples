package controllers
{
	import flash.debugger.enterDebugger;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	import models.Model;

	import org.swizframework.utils.services.ServiceRequestUtil;

	import views.MainView;

	public class Controller extends EventDispatcher
	{
		protected var _model:Model;

		/**
		 * Swiz now supports single argument setter injection.
		 * If your method takes more than one argument, it's not a setter.
		 */
		[Inject]
		public function setModel( model:Model ):void
		{
			_model = model;
		}

		[Inject( view="true" )]
		public function set theView( view:MainView ):void
		{
			trace( view );
		}

		public function Controller()
		{
			// Hi. I control stuff.
		}

		/**
		 * Strict event mode is not yet implemented.
		 */
		[Mediate( "testEvent" )]
		public function testHandler( e:Event ):void
		{
			_model.modelString = "Controller updated model after catching " + e.type + " event.";
		}
	}
}