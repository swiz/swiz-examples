package org.swizframework.moduleexample.model
{
	import mx.collections.ArrayCollection;
	import mx.formatters.DateFormatter;
	
	[Bindable]
	public class ModuleLogCollection extends ArrayCollection
	{
		private var dateFormatter : DateFormatter = new DateFormatter();
		
		public function ModuleLogCollection(source:Array=null)
		{
			super(source);
			dateFormatter = new DateFormatter();
			dateFormatter.formatString = 'L:NN:SS.QQQ - ';	
		}
		
		public function addLogMessage( message : String ) : void
		{
			addItem( dateFormatter.format( new Date() ) + message );
		}
		
	}
}