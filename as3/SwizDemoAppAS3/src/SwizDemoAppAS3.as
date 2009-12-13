package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import views.SwizView;
	
	[SWF( width="2000", height="2000", frameRate="30" )]
	public class SwizDemoAppAS3 extends Sprite
	{
		public function SwizDemoAppAS3()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			for( var i:int = 0; i < 5; i++ )
			{
				var sv:SwizView = new SwizView();
				sv.x = 20;
				sv.y = i * 175 + 20;
				addChild( sv );
			}
		}
	}
}
