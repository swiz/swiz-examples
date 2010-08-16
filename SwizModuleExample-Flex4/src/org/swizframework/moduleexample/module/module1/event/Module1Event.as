package org.swizframework.moduleexample.module.module1.event
{
	import flash.events.Event;
	
	public class Module1Event extends Event
	{
		public static const MODULE_1_EVENT : String = "org.swizframework.moduleexample.module.module1.event.Module1Event.MODULE_1_EVENT";
		
		public function Module1Event( type : String )
		{
			super( type, true, false );
		}
	}
}