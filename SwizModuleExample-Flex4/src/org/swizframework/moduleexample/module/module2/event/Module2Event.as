package org.swizframework.moduleexample.module.module2.event
{
	import flash.events.Event;
	
	public class Module2Event extends Event
	{
		public static const MODULE_2_EVENT : String = "org.swizframework.moduleexample.module.module2.event.Module2Event.MODULE_2_EVENT";
		
		public function Module2Event( type : String )
		{
			super( type, true, false );
		}
	}
}