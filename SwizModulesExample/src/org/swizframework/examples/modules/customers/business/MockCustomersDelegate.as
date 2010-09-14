package org.swizframework.examples.modules.customers.business
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.rpc.AsyncToken;
	
	import org.swizframework.examples.modules.customers.model.domain.Customer;
	import org.swizframework.utils.services.MockDelegateHelper;

	public class MockCustomersDelegate implements ICustomersDelegate
	{
		[Inject]
		public var mdh:MockDelegateHelper;
		
		public function getCustomers():AsyncToken
		{
			return mdh.createMockResult( getFakeCustomers(), 250 );
		}
		
		private function getFakeCustomers():ArrayCollection
		{
			var customers:ArrayCollection = new ArrayCollection();
			
			customers.addItem( new Customer( "AAA", "Awesome Tech, Inc.", "Anywhere, U.S.A." ) );
			customers.addItem( new Customer( "BBB", "Biz Builders", "Westfield, MA" ) );
			customers.addItem( new Customer( "CCC", "Core Players LLC", "Golden, CO" ) );
			customers.addItem( new Customer( "DDD", "Dominant Design", "Grand Rapids, MI" ) );
			customers.addItem( new Customer( "EEE", "Eminent Engagements", "San Francisco, CA" ) );
			
			return customers;
		}
	}
}