package com.cafetownsend.model
{
	import spark.effects.easing.IEaser;
	import spark.effects.easing.Power;

	final public class Constants
	{
		//
		// effects
		public static const EFFECT_DURATION:int = 400;	
		public static const EFFECT_EASE: IEaser = new Power( 0.30 );
	}
}