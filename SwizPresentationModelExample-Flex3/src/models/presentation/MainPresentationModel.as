package models.presentation
{
	import models.ApplicationModel;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class MainPresentationModel extends EventDispatcher implements IMainPresentationModel
	{
		/**
		 * The Autowire metadata states that Swiz should inject the activeView property from its appModel
		 * bean into this property. Since this property and the source property (ApplicationModel::activeView)
		 * are both marked Bindable, Swiz will create a binding between them to ensure changes in
		 * ApplicationModel will be propagated to this component.
		 * 
		 * However, notice the twoWay="true" attribute as well. This will cause Swiz to set up a reverse binding
		 * so that changes to our local activeView property will be propagated back to ApplicationModel.
		 */
		[Autowire( bean="appModel", property="activeView", twoWay="true" )]
		[Bindable]
		public var activeView:int;
		
		public function MainPresentationModel()
		{
			super();
		}
		
		public function setActiveView( index:int ):void
		{
			activeView = index;
		}
	}
}