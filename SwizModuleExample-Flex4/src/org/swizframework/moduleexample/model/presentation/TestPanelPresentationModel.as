package org.swizframework.moduleexample.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.core.UIComponent;
	
	import org.swizframework.moduleexample.event.RootEvent;
	import org.swizframework.moduleexample.model.ModuleLogCollection;
	import org.swizframework.moduleexample.module.module1.event.Module1Event;
	import org.swizframework.moduleexample.module.module2.event.Module2Event;
	import org.swizframework.moduleexample.view.ModuleExamplesOverviewPopUp;

	public class TestPanelPresentationModel
	{

		[Dispatcher]
		/**
		 * Have Swiz inject an event dispatcher.
		 */ 
		public var dispatcher : IEventDispatcher;
		
		/**
		 * Dispatch an event from the root Swiz app that can be mediated by the child Swiz apps.
		 */ 
		public function sendRootEvent() : void
		{
			if( isModule1Loaded )
			{
				module1Log.addLogMessage( 'Dispatching event from the root Swiz application.' );
			}
			if( isModule2Loaded )
			{
				module2Log.addLogMessage( 'Dispatching event from the root Swiz application.' );
			}
			dispatcher.dispatchEvent( new RootEvent( RootEvent.GLOBAL_TEST_EVENT ) );
		}
		
		/**
		 * Show the initial PopUp that simply lists some of the things this example will demonstrate.
		 */ 
		public function showOverviewPopUp( target : UIComponent ) : void
		{
			ModuleExamplesOverviewPopUp.createPopUp( target );
		}
		
		/* ********* Behavior for working with Module 1 ********** */
		
		[Bindable]
		[Inject( source="moduleLog.module1Log", bind="true" )]
		/**
		 * The log for actions related to Module1.
		 */ 
		public var module1Log : ModuleLogCollection;
		
		[Bindable]
		public var isModule1Loaded : Boolean = false;
		
		/**
		 * When Module1 loads, automatically dispatch an event that the module can handle.
		 */ 
		public function module1Loaded() : void
		{
			isModule1Loaded = true;
			module1Log.addLogMessage( 'Dispatching an event from root Swiz application after loading Module1.' );
			dispatcher.dispatchEvent( new RootEvent( RootEvent.GLOBAL_TEST_EVENT ) );
		}
		
		/**
		 * Dispatch an event from the root that should only be handled by Module1.
		 */ 
		public function sendModule1Event() : void
		{
			module1Log.addLogMessage( 'Dispatching an event from root Swiz application to only Module1.' );
			dispatcher.dispatchEvent( new RootEvent( RootEvent.TEST_EVENT_FOR_MODULE_1 ) );
		}
		
		/**
		 * Dispatch an event to Module1 to trigger the module to create a PopUp. 
		 * The module will use the registerWindow() method to ensure that it is processed.
		 */ 
		public function sendModule1PopUpEvent() : void
		{
			module1Log.addLogMessage( 'Dispatching an event to only Module1 to trigger PopUp creation.' );
			dispatcher.dispatchEvent( new RootEvent( RootEvent.TEST_EVENT_FOR_MODULE_1_POPUP ) );
		}
		
		[EventHandler( event="Module1Event.MODULE_1_EVENT" )]
		/**
		 * Have the root Swiz application mediate an event dispatched from Module1.
		 */ 
		public function module1EventMediator( event : Module1Event ) : void
		{
			module1Log.addLogMessage( 'Root Swiz application mediated an event from Module1.' );
		}
		
		public function resetModule1Log() : void
		{
			module1Log.source = [];
		}
		
		/* ********* Behavior for working with Module 2 ********** */
		
		[Bindable]
		public var isModule2Loaded : Boolean = false;
		
		[Bindable]
		[Inject( source="moduleLog.module2Log", bind="true" )]
		/**
		 * The log for actions related to Module2.
		 */
		public var module2Log : ModuleLogCollection;
		
		/**
		 * When Module2 loads, automatically dispatch an event that the module can handle.
		 */
		public function module2Loaded() : void
		{
			isModule2Loaded = true;
			module2Log.addLogMessage( 'Dispatching an event from root Swiz application after loading Module2.' );
			dispatcher.dispatchEvent( new RootEvent( RootEvent.GLOBAL_TEST_EVENT ) );
		}
		
		[EventHandler( event="Module2Event.MODULE_2_EVENT" )]
		/**
		 * Have the root Swiz application mediate an event dispatched from Module2.
		 */
		public function module2EventMediator( event : Module2Event ) : void
		{
			module2Log.addLogMessage( 'Root Swiz application mediated an event from Module2.' );
		}
		
		/**
		 * Dispatch an event from the root that should only be handled by Module2.
		 */
		public function sendModule2Event() : void
		{
			module2Log.addLogMessage( 'Dispatching an event from root Swiz application to only Module2.' );
			dispatcher.dispatchEvent( new RootEvent( RootEvent.TEST_EVENT_FOR_MODULE_2 ) );
		}
		
		public function resetModule2Log() : void
		{
			module2Log.source = [];
		}
		
	}
}