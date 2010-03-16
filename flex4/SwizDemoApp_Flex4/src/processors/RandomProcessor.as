package processors
{
	import org.swizframework.core.Bean;
	import org.swizframework.processors.BaseMetadataProcessor;
	import org.swizframework.reflection.IMetadataTag;

	/**
	 * Random Processor
	 */
	public class RandomProcessor extends BaseMetadataProcessor
	{
		// ========================================
		// constructor
		// ========================================

		/**
		 * Constructor
		 */
		public function RandomProcessor()
		{
			super( [ "Random" ] );
		}

		// ========================================
		// public methods
		// ========================================

		/**
		 * Assign a random number to the decorated property.
		 */
		override public function setUpMetadataTag( metadataTag:IMetadataTag, bean:Bean ):void
		{
			bean.source[ metadataTag.host.name ] = Math.round( Math.random() * 1000 );
		}

		/**
		 * Remove random
		 */
		override public function tearDownMetadataTag( metadataTag:IMetadataTag, bean:Bean ):void
		{
			bean.source[ metadataTag.host.name ] = 0;
		}
	}
}