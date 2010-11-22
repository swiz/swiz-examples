package org.swizframework.examples.events
{
	import flash.events.Event;
	
	public class ApplicationEvent extends Event
	{
		public static const CURRENT_CUSTOMER_CHANGED:String = "currentCustomerChanged";
		
		public function ApplicationEvent( type:String )
		{
			super( type );
		}
	}
}