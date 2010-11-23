package org.swizframework.moduleexample.model
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.formatters.DateFormatter;
	
	[Bindable]
	/**
	 * This class holds a log of what is going on. It uses a simple timer to add 
	 * a divider once a given series of log messages is finished, to help the user
	 * visualize the different actions that this example application is performing.
	 */ 
	public class ModuleLogCollection extends ArrayCollection
	{
		private var addDividerTimer : Timer;
		private var previousLogCount : int = 0;
		
		public function ModuleLogCollection(source:Array=null)
		{
			super(source);
			addDividerTimer = new Timer( 300 );
			addDividerTimer.addEventListener( TimerEvent.TIMER, addDividerTimerHandler, false, 0, true );
		}
		
		public function addLogMessage( message : String ) : void
		{
			addItem( message );
			
			if( !addDividerTimer.running ) {
				previousLogCount = this.length;
				addDividerTimer.start();	
			}
		}
		
		public function addLogDivider() : void
		{
			addItem( '--------------------------------------------------------------------------------------------------' );
		}
		
		private function addDividerTimerHandler( event : Event ) : void
		{
			if( this.length == previousLogCount )
			{
				addDividerTimer.stop();
				addLogDivider();
			}
			previousLogCount = this.length;
		}
		
	}
}