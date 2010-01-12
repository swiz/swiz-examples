package processors
{
	import org.swizframework.core.Bean;
	import org.swizframework.processors.MetadataProcessor;
	import org.swizframework.reflection.IMetadataTag;
	
	/**
	 * Random Processor
	 */
	public class RandomProcessor extends MetadataProcessor
	{
		// ========================================
		// constructor
		// ========================================
		
		/**
		 * Constructor
		 */
		public function RandomProcessor()
		{
			super( "Random" );
		}
		
		// ========================================
		// public methods
		// ========================================
		
		/**
		 * Assign a random number to the decorated property.
		 */
		override public function addMetadata( metadataTag:IMetadataTag, bean:Bean ):void
		{
			bean.source[ metadataTag.host.name ] = Math.round( Math.random() * 1000 );
		}
		
		/**
		 * Remove random
		 */
		override public function removeMetadata( metadataTag:IMetadataTag, bean:Bean ):void
		{
			bean.source[ metadataTag.host.name ] = 0;
		}
	}
}