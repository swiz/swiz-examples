package org.swizframework.moduleexample.module.module1.model.presentation
{
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import org.swizframework.core.ISwiz;
	import org.swizframework.core.ISwizAware;
	import org.swizframework.moduleexample.event.RootEvent;
	import org.swizframework.moduleexample.model.ModuleLogCollection;
	import org.swizframework.moduleexample.module.module1.Module1PopUp;
	import org.swizframework.moduleexample.module.module1.event.Module1Event;
	import org.swizframework.moduleexample.module.module2.event.Module2Event;

	public class Module1PresentationModel implements ISwizAware
	{
		
		[Dispatcher]
		/**
		 * Have Swiz inject an event dispatcher.
		 */
		public var dispatcher : IEventDispatcher;
		
		[Bindable]
		[Inject( source="moduleLog.module1Log", bind="true" )]
		/**
		 * The log for actions related to Module1. Note that this bean is actually defined 
		 * in the root Swiz application, but can be easily injected into the Module.
		 */ 
		public var module1Log : ModuleLogCollection;
		
		/**
		 * Implement ISwizAware so that we have a reference to Swiz to use to register new PopUps.
		 */ 
		public function set swiz( swiz : ISwiz ) : void
		{
			_swiz = swiz;
		}
		
		private var _swiz : ISwiz;
		
		[EventHandler( event="Module2Event.MODULE_2_EVENT" )]
		/**
		 * Handle an event dispached from Module2.
		 */ 
		public function handleModule2Event( event : Module2Event ) : void
		{
			module1Log.addLogMessage( 'Mediating Module2Event.MODULE_2_EVENT in Module1.' );
		}
		
		[EventHandler( event="RootEvent.GLOBAL_TEST_EVENT" )]
		/**
		 * Handle an event dispatched from the root Swiz application that is not meant for a specific Module.
		 */ 
		public function handleRootEvent( event : RootEvent ) : void
		{
			module1Log.addLogMessage( 'Mediating RootEvent.GLOBAL_TEST_EVENT in Module1.' );
		}
		
		[EventHandler( event="RootEvent.TEST_EVENT_FOR_MODULE_1" )]
		/**
		 * Handle an event dispatched from the root Swiz application to only this Module.
		 */ 
		public function handleRootEventForModule1( event : RootEvent ) : void
		{
			module1Log.addLogMessage( 'Mediating RootEvent.TEST_EVENT_FOR_MODULE_1 in Module1.' );
			module1Log.addLogMessage( 'Dispatching Module1Event.MODULE_1_EVENT from Module1.' );
			dispatcher.dispatchEvent( new Module1Event( Module1Event.MODULE_1_EVENT ) );
		}
		
		[EventHandler( event="RootEvent.TEST_EVENT_FOR_MODULE_1_POPUP" )]
		/**
		 * Handle an event from the root Swiz application to trigger this Module to create a new PopUp.
		 */ 
		public function handleRootEventForModule1PopUp( event : RootEvent ) : void
		{
			module1Log.addLogMessage( 'Mediating RootEvent.TEST_EVENT_FOR_MODULE_1_POPUP in Module1.' );
			var popUp : Module1PopUp = new Module1PopUp();
			popUp.showPopUp( FlexGlobals.topLevelApplication.document, _swiz );
		}
		
		[PostConstruct]
		/**
		 * After this bean is processed, add some initial log messages.
		 */ 
		public function addLogMessage() : void
		{
			module1Log.addLogMessage( 'This is Module1.' );
			module1Log.addLogMessage( 'Module1 had a root bean injected: ModuleLog.module1Log.' );
		}
		
	}
}