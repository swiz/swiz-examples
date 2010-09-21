package
{
	import org.swizframework.core.Bean;
	import org.swizframework.processors.BaseMetadataProcessor;
	import org.swizframework.processors.ProcessorPriority;
	import org.swizframework.reflection.IMetadataTag;
	
	public class ViewMediatorProcessor extends BaseMetadataProcessor
	{
		public function ViewMediatorProcessor()
		{
			super( [ "ViewMediator" ] );
		}
		
		override public function setUpMetadataTag( metadataTag:IMetadataTag, bean:Bean ):void
		{
			trace( metadataTag.host );
		}
		
		override public function get priority():int
		{
			return ProcessorPriority.DEFAULT;
		}
	}
}