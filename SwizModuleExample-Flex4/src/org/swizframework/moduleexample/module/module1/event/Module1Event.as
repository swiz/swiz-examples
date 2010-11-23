package org.swizframework.moduleexample.module.module1.event
{
	import flash.events.Event;
	
	/**
	 * This class represents events that will be dispached FROM Module1 to the root Swiz application and other Modules.
	 */ 
	public class Module1Event extends Event
	{
		public static const MODULE_1_EVENT : String = "org.swizframework.moduleexample.module.module1.event.Module1Event.MODULE_1_EVENT";
		
		public function Module1Event( type : String )
		{
			super( type, true, false );
		}
	}
}