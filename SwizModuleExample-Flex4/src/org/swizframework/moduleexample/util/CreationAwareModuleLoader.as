package org.swizframework.moduleexample.util
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.net.LocalConnection;
	import flash.system.ApplicationDomain;
	import flash.system.System;
	
	import mx.core.Container;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ModuleEvent;
	import mx.modules.Module;
	import mx.modules.ModuleLoader;
	import mx.styles.StyleManager;
	
	[Event(name="onModuleCreationComplete", type="flash.events.Event")]
	public class CreationAwareModuleLoader extends ModuleLoader
	{
		public static const MODULE_CREATION_COMPLETE : String = "onModuleCreationComplete";
		
		public function CreationAwareModuleLoader()
		{
			super();
			addEventListener( ModuleEvent.READY, onReady, false, 0, true );
		}
		
		public override function set url( value : String ) : void
		{
			super.url = value;
		}
		
		public function destroyModule( focusTarget : UIComponent ) : void
		{
			// Sometimes if something in the module has focus, Flash won't actually unload it. So force focus to some non-module element.
			focusTarget.setFocus();
			applicationDomain = null;
			Container( child ).removeAllChildren();
			url = '';
			unloadModule();
		}
		
		private function onReady( event : ModuleEvent ) : void
		{
			if( child && child is UIComponent )
			{
				child.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete, false, -100, true );
			}	
		}
		
		private function onCreationComplete( event : Event ) : void
		{
			if( child && child is UIComponent )
			{
				child.removeEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete, false );
				
				/* 
					We will wait for the updateComplete event to be certain that all 
					children have been added to the stage, since addedToStage executes
					after creationComplete.
				*/
				child.addEventListener( FlexEvent.UPDATE_COMPLETE, onUpdateComplete, false, -100, true );
			}
		}
		
		private function onUpdateComplete( event : Event ) : void
		{	
			if( child && child is UIComponent )
			{	
				child.removeEventListener( FlexEvent.UPDATE_COMPLETE, onUpdateComplete, false );
				dispatchReadyEvent();
			}	
		}
		
		private function dispatchReadyEvent() : void
		{
			dispatchEvent( new Event( MODULE_CREATION_COMPLETE, true ) );
		}
		
	}
}