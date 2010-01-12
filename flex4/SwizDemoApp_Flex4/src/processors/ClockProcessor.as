package processors
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.swizframework.core.Bean;
	import org.swizframework.processors.MetadataProcessor;
	import org.swizframework.reflection.IMetadataTag;
	
	/**
	 * Clock Processor
	 */
	public class ClockProcessor extends MetadataProcessor
	{
		/**
		 * The metadata tag that triggered this processor.
		 */
		protected var metadataTag:IMetadataTag;
		
		/**
		 * The object which contains the corresponding metadata tag to be processed.
		 */
		protected var bean:Bean;
		
		// ========================================
		// constructor
		// ========================================
		
		/**
		 * Constructor
		 */
		public function ClockProcessor()
		{
			super( "Clock" );
		}
		
		// ========================================
		// public methods
		// ========================================
		
		/**
		 * Method called when metadata is encountered to initiate processing.
		 */
		override public function addMetadata( metadataTag:IMetadataTag, bean:Bean ):void
		{
			// store refs
			this.metadataTag = metadataTag;
			this.bean = bean;
			// run setter immediately to prevent timer delay
			setTime();
			
			// create timer to update value every second
			var t:Timer = new Timer( 1000 );
			t.addEventListener( TimerEvent.TIMER, setTime );
			t.start();
		}
		
		protected function setTime( e:TimerEvent = null ):void
		{
			var d:Date = new Date();
			var mins:String = ( d.getMinutes() < 10 ) ? "0" + String( d.getMinutes() ) : String( d.getMinutes() );
			var secs:String = ( d.getSeconds() < 10 ) ? "0" + String( d.getSeconds() ) : String( d.getSeconds() );
			// assign current time to decorated property
			bean.source[ metadataTag.host.name ] = d.getHours() % 12 + ":" + mins + "::" + secs;
		}
		
		override public function removeMetadata( metadataTag:IMetadataTag, bean:Bean ):void
		{
			bean.source[ metadataTag.host.name ] = "";
		}
	}
}