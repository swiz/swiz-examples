package com.cafetownsend.event
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		
		public static const UPDATE_PATH:String = "NavigationEvent.UPDATE_PATH";
		
		
		public function NavigationEvent(type:String, path: String = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			this._path = path;
		}
		
		
		protected var _path: String;
		
		public function get path():String
		{
			return _path;
		}
		
		
		
		override public function clone():Event
		{
			return new NavigationEvent(type, this.path, bubbles, cancelable);
		}
	}
}