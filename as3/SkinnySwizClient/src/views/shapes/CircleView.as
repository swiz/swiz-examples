package views.shapes
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;

	public class CircleView extends Sprite
	{
		// ========================================
		// private properties
		// ========================================
		
		private var g:Graphics = graphics;
		
		// ========================================
		// public properties
		// ========================================
		
		[Autowire]
		public var color:uint = 0x000000;
		
		[Autowire( bean="alphaBean" )]
		public var alphaLevel:Number = .2;
		
		[Autowire( bean="sizeModel", property="radiusSize" )]
		public var radius:Number = 5;
		
		public function CircleView()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, onAdded );
		}
		
		private function onAdded( event:Event ):void
		{
			g.clear();
			g.beginFill( color, alphaLevel );
			g.drawCircle( 0, 0, radius );
			g.endFill();
		}
	}
}