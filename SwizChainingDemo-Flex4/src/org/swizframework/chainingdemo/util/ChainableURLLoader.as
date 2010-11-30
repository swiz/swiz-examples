package org.swizframework.chainingdemo.util
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import org.swizframework.utils.chain.IAsyncChainStep;

	public class ChainableURLLoader extends URLLoader
	{
		public var step : IAsyncChainStep;
	}
}