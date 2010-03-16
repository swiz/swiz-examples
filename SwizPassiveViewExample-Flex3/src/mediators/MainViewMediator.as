package mediators
{
	import flash.events.Event;
	
	import models.ApplicationModel;
	
	import mx.events.IndexChangedEvent;
	
	import views.MainView;
	
	public class MainViewMediator
	{
		/**
		 * Backing variable for <code>appModel</code> setter.
		 */
		protected var _appModel:ApplicationModel;
		
		/**
		 * Instruct Swiz to Autowire by type.
		 */
		[Autowire]
		public function set appModel( value:ApplicationModel ):void
		{
			_appModel = value;
			_appModel.addEventListener( "activeViewChanged", handleActiveViewChanged );
		}
		
		/**
		 * Listen for model changes and update view accordingly.
		 * (Nobody but this class updates the model in this app, provided as an example.)
		 */
		protected function handleActiveViewChanged( event:Event ):void
		{
			if( _view )
				_view.selectedIndex = _appModel.activeView;
		}
		
		/**
		 * Backing variable for <code>view</code> setter.
		 */
		protected var _view:MainView;
		
		/**
		 * Providing view="true" in the [Autowire] tag tells Swiz
		 * the item to inject will be a view rather than a bean.
		 * In response to the injectionEvent specified in SwizConfig,
		 * Swiz will inject the view into this setter.
		 */
		[Autowire( view="true" )]
		public function set view( value:MainView ):void
		{
			_view = value;
			
			// set initial value
			_view.selectedIndex = _appModel.activeView;
			
			// listen for view changes
			_view.addEventListener( IndexChangedEvent.CHANGE, handleViewIndexChange );
			
			// don't get in GC's way if the view is removed
			_view.addEventListener( Event.REMOVED_FROM_STAGE, cleanup );
		}
		
		/**
		 * Update model in response to view action.
		 */
		protected function handleViewIndexChange( event:IndexChangedEvent ):void
		{
			_appModel.activeView = _view.selectedIndex;
		}
		
		/**
		 * Remove any listeners we've created.
		 */
		protected function cleanup( event:Event ):void
		{
			_view.removeEventListener( IndexChangedEvent.CHANGE, handleViewIndexChange );
			_view.removeEventListener( Event.REMOVED_FROM_STAGE, cleanup );
			
			_appModel.removeEventListener( "activeViewChanged", handleActiveViewChanged );
		}
	}
}