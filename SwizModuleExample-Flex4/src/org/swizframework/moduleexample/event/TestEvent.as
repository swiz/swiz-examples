package org.swizframework.moduleexample.event
{
	import flash.events.Event;
	
	public class TestEvent extends Event
	{
		public static const GLOBAL_TEST_EVENT : String = "org.swizframework.moduleexample.event.TestEvent.GLOBAL_TEST_EVENT";
		public static const TEST_EVENT_FOR_MODULE_1 : String = "org.swizframework.moduleexample.event.TestEvent.TEST_EVENT_FOR_MODULE_1";
		public static const TEST_EVENT_FOR_MODULE_1_POPUP : String = "org.swizframework.moduleexample.event.TestEvent.TEST_EVENT_FOR_MODULE_1_POPUP";
		public static const TEST_EVENT_FOR_MODULE_2 : String = "org.swizframework.moduleexample.event.TestEvent.TEST_EVENT_FOR_MODULE_2";
		
		public function TestEvent( type : String )
		{
			super( type, true, false );
		}
	}
}