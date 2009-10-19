package mediators
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import models.ApplicationModel;
	import models.Employee;
	
	import mx.events.ListEvent;
	
	import views.EmployeeView;
	
	public class EmployeeViewMediator
	{
		/**
		 * Backing variable for <code>selectedEmployee</code> setter.
		 */
		protected var _selectedEmployee:Employee;
		
		protected function set selectedEmployee( value:Employee ):void
		{
			_selectedEmployee = value;
			
			_view.employeeForm.visible = _view.divider.visible = _selectedEmployee != null;
			
			if( _selectedEmployee != null )
			{
				_view.nameInput.text = _selectedEmployee.name;
				_view.locationInput.text = _selectedEmployee.location;
			}
		}
		
		/**
		 * Backing variable for <code>appModel</code> setter.
		 */
		protected var _appModel:ApplicationModel;
		
		/**
		 * Will be autowired by type.
		 */
		[Autowire]
		public function set appModel( value:ApplicationModel ):void
		{
			_appModel = value;
		}
		
		/**
		 * Backing variable for <code>view</code> setter.
		 */
		protected var _view:EmployeeView;
		
		/**
		 * Providing view="true" in the [Autowire] tag tells Swiz
		 * the item to inject will be a view rather than a bean.
		 * In response to the injectionEvent specified in SwizConfig,
		 * Swiz will inject the view into this setter.
		 */
		[Autowire( view="true" )]
		public function set view( value:EmployeeView ):void
		{
			_view = value;
			
			// populate list
			_view.dg.dataProvider = _appModel.employees;
			
			// listen for list selections
			_view.dg.addEventListener( ListEvent.ITEM_CLICK, handleDgItemClick );
			
			// add button handlers
			_view.saveBtn.addEventListener( MouseEvent.CLICK, handleSaveBtnClick );
			_view.cancelBtn.addEventListener( MouseEvent.CLICK, handleCancelBtnClick );
			
			// don't get in GC's way if the view is removed
			_view.addEventListener( Event.REMOVED_FROM_STAGE, cleanup );
		}
		
		/**
		 * Set internal property in response to action in view.
		 */
		protected function handleDgItemClick( event:ListEvent ):void
		{
			selectedEmployee = _view.dg.selectedItem as Employee;
		}
		
		/**
		 * Save user edits.
		 */
		protected function handleSaveBtnClick( event:Event ):void
		{
			_selectedEmployee.name = _view.nameInput.text;
			_selectedEmployee.location = _view.locationInput.text;
		}
		
		/**
		 * Reset view.
		 */
		protected function handleCancelBtnClick( event:Event ):void
		{
			selectedEmployee = null;
		}
		
		/**
		 * Remove any listeners we've created.
		 */
		protected function cleanup( event:Event ):void
		{
			_view.dg.removeEventListener( ListEvent.ITEM_CLICK, handleDgItemClick );
			_view.saveBtn.removeEventListener( MouseEvent.CLICK, handleSaveBtnClick );
			_view.cancelBtn.removeEventListener( MouseEvent.CLICK, handleCancelBtnClick );
			
			_view.removeEventListener( Event.REMOVED_FROM_STAGE, cleanup );
		}
	}
}