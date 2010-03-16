package controllers
{
	import mx.collections.ArrayCollection;

	public class ApplicationController
	{
		/**
		 * Swiz will inject the employees collection from ApplicationModel here
		 * so we can operate on a local property rather than reaching out for
		 * pieces we need. Dependency injection FTW.
		 */
		[Autowire( bean="appModel", property="employees" )]
		public var employees:ArrayCollection;
		
		public function ApplicationController()
		{
			super();
		}
		
		/**
		 * This is what Swiz calls a dynamic mediator. The [Mediate] tag basically
		 * says any time Swiz encounters a UserEvent whose type is UserEvent.SAVE_USER,
		 * it should call this method and pass in the event's user property.
		 * Your controller methods now don't even know they are called in response to events,
		 * which means they can be easily called with mock values during testing.
		 * (Note that providing just the class name requires that the package has been
		 * included in Swiz's eventPackages config setting.)
		 * 
		 * Thanks to this dynamic mediation and the employees collection being injected,
		 * this class has virtually no knowledge of the surrounding application and
		 * can function as an independent unit. Again, w00t!
		 */
		[Mediate( event="UserEvent.SAVE_USER", properties="user" )]
		public function saveUser( user:Object ):void
		{
			for each( var employee:Object in employees )
			{
				if( employee.id == user.id )
				{
					employee.name = user.name;
					employee.location = user.location;
					break;
				}
			}
		}
	}
}