package org.swizframework.quickswiz.event
{
	import org.swizframework.quickswiz.model.User;
	import flash.events.Event;
	
	public class UserEvent extends Event
	{
		public static const SAVE_USER_REQUESTED : String = "saveUser"; 
		public var user : User;
		
		/**
		 * This is just a normal Flex event. The only thing to note is that we set 'bubbles' to true,
		 * so that the event will bubble up the display list, allowing Swiz to listen for your events.
		 */ 
		public function UserEvent( type:String )
		{
			super( type, true );
		}
	}
}