package org.swizframework.moduleexample.event
{
	import flash.events.Event;
	
	/**
	 * This Event class represents events dispatched from the Root (aka Parent) Swiz application.
	 * The modules will respond to these events.
	 */ 
	public class RootEvent extends Event
	{
		public static const GLOBAL_TEST_EVENT : String = "org.swizframework.moduleexample.event.RootEvent.GLOBAL_TEST_EVENT";
		public static const TEST_EVENT_FOR_MODULE_1 : String = "org.swizframework.moduleexample.event.RootEvent.TEST_EVENT_FOR_MODULE_1";
		public static const TEST_EVENT_FOR_MODULE_1_POPUP : String = "org.swizframework.moduleexample.event.RootEvent.TEST_EVENT_FOR_MODULE_1_POPUP";
		public static const TEST_EVENT_FOR_MODULE_2 : String = "org.swizframework.moduleexample.event.RootEvent.TEST_EVENT_FOR_MODULE_2";
		
		public function RootEvent( type : String )
		{
			super( type, true, false );
		}
	}
}