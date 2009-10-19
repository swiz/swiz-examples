package models.presentation
{
	import events.UserEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class EmployeeViewPresentationModel extends EventDispatcher implements IEmployeeViewPresentationModel
	{
		// dispatcher that will be set from constructor (via Prototype tag in Beans.mxml),
		// allowing this non-view class to dispatch bubbling events
		private var dispatcher:IEventDispatcher;
		
		public function EmployeeViewPresentationModel( dispatcher:IEventDispatcher )
		{
			this.dispatcher = dispatcher;
		}
		
		/**
		 * Inject the employees property of ApplicationModel into this field.
		 */
		[Autowire( bean="appModel", property="employees" )]
		[Bindable]
		public var employees:ArrayCollection;
		
		
		// ========================================
		// selectedEmployee property (read only)
		// ========================================
		
		/**
		 * @private
		 * 
		 * Backing variable for read-only <code>selectedEmployee</code> getter.
		 */
		private var _selectedEmployee:Object;
		
		[Bindable( "selectedEmployeeChanged" )]
		public function get selectedEmployee():Object
		{
			return _selectedEmployee;
		}
		
		// setter method
		public function setSelectedEmployee( value:Object ):void
		{
			if ( _selectedEmployee != value )
			{
				_selectedEmployee = value;
				dispatchEvent( new Event( "selectedEmployeeChanged" ) );
			}
		}
		
		/**
		 * Views using this model could obviously check selectedEmployee != null themselves.
		 * However, one of the main points of using presentation model is for your views
		 * to know as little as possible about the underlying model, and creating an explicit
		 * property is good encapsulation.
		 */
		[Bindable( "selectedEmployeeChanged" )]
		public function get isFormVisible():Boolean
		{
			return selectedEmployee != null;
		}
		
		/**
		 * When the view requests an object be saved we simply attach it to an event and dispatch
		 * through our injected dispatcher. This will allow the event to bubble and be caught by Swiz.
		 */
		public function saveUser( user:Object ):void
		{
			dispatcher.dispatchEvent( new UserEvent( UserEvent.SAVE_USER, user ) );
		}
	}
}