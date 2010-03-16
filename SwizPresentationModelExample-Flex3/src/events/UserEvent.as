package events
{
	import flash.events.Event;

	public class UserEvent extends Event
	{
		// event constant
		public static const SAVE_USER:String = "saveUser";
		
		// data payload
		public var user:Object;
		
		public function UserEvent( type:String, user:Object )
		{
			super( type, true, true );
			
			this.user = user;
		}
		
		/**
		 * You MUST override Event's clone() method!!!
		 * 
		 * In order for Swiz to handle bubbled events they must be caught and redispatched
		 * so if you don't override clone() it will not work. Overriding clone() is a good
		 * Flex coding practice regardless of what application framework you are using so
		 * if you are not already in the habit of doing so, you should start.
		 */
		override public function clone():Event
		{
			return new UserEvent( type, user );
		}
	}
}