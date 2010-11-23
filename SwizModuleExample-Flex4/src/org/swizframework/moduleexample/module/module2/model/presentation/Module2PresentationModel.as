package org.swizframework.moduleexample.module.module2.model.presentation
{
	public class Module2PresentationModel
	{
		import org.swizframework.moduleexample.event.RootEvent;
		import org.swizframework.moduleexample.model.ModuleLogCollection;
		import org.swizframework.moduleexample.module.module1.event.Module1Event;
		import org.swizframework.moduleexample.module.module2.event.Module2Event;
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[Bindable]
		[Inject( source="moduleLog.module2Log", bind="true" )]
		/**
		 * The log for actions related to Module2. Note that this bean is actually defined 
		 * in the root Swiz application, but can be easily injected into the Module.
		 */ 
		public var module2Log : ModuleLogCollection;
		
		[EventHandler( event="Module1Event.MODULE_1_EVENT" )]
		/**
		 * Handle an event dispached from Module1.
		 */ 
		public function handleModule1Event( event : Module1Event ) : void
		{
			module2Log.addLogMessage( 'Mediating Module1Event.MODULE_1_EVENT in Module2.' );
		}
		
		[EventHandler( event="RootEvent.GLOBAL_TEST_EVENT" )]
		/**
		 * Handle an event dispatched from the root Swiz application that is not meant for a specific Module.
		 */ 
		public function handleRootEvent( event : RootEvent ) : void
		{
			module2Log.addLogMessage( 'Mediating RootEvent.GLOBAL_TEST_EVENT in Module2.' );
		}
		
		[EventHandler( event="RootEvent.TEST_EVENT_FOR_MODULE_2" )]
		/**
		 * Handle an event dispatched from the root Swiz application to only this Module.
		 */ 
		public function handleRootEventForModule2( event : RootEvent ) : void
		{
			module2Log.addLogMessage( 'Mediating RootEvent.TEST_EVENT_FOR_MODULE_2 in Module2.' );
			module2Log.addLogMessage( 'Dispatching Module2Event.MODULE_2_EVENT from Module2.' );
			dispatcher.dispatchEvent( new Module2Event( Module2Event.MODULE_2_EVENT ) );
		}
		
		[PostConstruct]
		/**
		 * After this bean is processed, add some initial log messages.
		 */ 
		public function addLogMessage() : void
		{
			module2Log.addLogMessage( 'This is Module2.' );
			module2Log.addLogMessage( 'Module2 had a root bean injected: ModuleLog.module2Log' );
		}
	}
}