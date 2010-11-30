package org.swizframework.chainingdemo.model.domain
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class LoggingHost
	{
		
		public var activityLog : ArrayCollection = new ArrayCollection();
		public var eventLog : ArrayCollection = new ArrayCollection();
		
		public function resetLogs() : void
		{
			activityLog.source = [];
			eventLog.source = [];
		}
		
		[EventHandler( event="UserEvent.*", priority="100" )]
		/**
		 * Run a simple event chain.
		 */
		public function updateEventLog( event : Event ) : void
		{
			eventLog.addItem( event.type );
		}
		
	}
}