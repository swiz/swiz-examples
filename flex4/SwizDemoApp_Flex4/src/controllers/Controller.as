package controllers
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import models.Model;
	
	public class Controller extends EventDispatcher
	{
		protected var _model:Model;
		
		/**
		 * Swiz now supports setter injection.
		 * It is currently limited to single argument methods pending community feedback.
		 * Should we support multiple argument setter methods?
		 */
		[Autowire]
		public function setModel( model:Model ):void
		{
			_model = model;
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