package org.swizframework.chainingdemo.service
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	
	import org.swizframework.chainingdemo.model.domain.Promotion;
	import org.swizframework.chainingdemo.model.domain.User;
	import org.swizframework.utils.services.MockDelegateHelper;
	
	public class MockUserService
	{
		
		[Inject]
		public var mockHelper : MockDelegateHelper;
		
		public function loadUser() : AsyncToken
		{	
			// Return the User after some simulated request time to the server.
			return mockHelper.createMockResult( buildMockUser(), 3000 );
		}
		
		public function loadUserPromotions() : AsyncToken
		{	
			// Return the promotions after some simulated request time to the server.
			return mockHelper.createMockResult( buildMockUserPromotions(), 3000 );
		}
		
		public function loadGlobalPromotions() : AsyncToken
		{	
			// Return the promotions after some simulated request time to the server.
			return mockHelper.createMockResult( buildMockGlobalPromotions(), 3000 );
		}
		
		public function updateUserHistory() : AsyncToken
		{	
			// Return a result after some simulated request time to the server.
			return mockHelper.createMockResult( null, 2000 );
		}
		
		private function buildMockUser() : User
		{
			var user : User = new User();
			user.userName = 'Ellen Ripley';
			return user;	
		}
		
		private function buildMockUserPromotions() : ArrayCollection
		{
			var result : ArrayCollection = new ArrayCollection();
			result.addItem( new Promotion( 'You might like movies by David Fincher.' ) );
			result.addItem( new Promotion( 'You might like movies by Stanley Kubrick.' ) );
			return result;
		}
		
		private function buildMockGlobalPromotions() : ArrayCollection
		{
			var result : ArrayCollection = new ArrayCollection();
			result.addItem( new Promotion( 'All books are 10% off today.' ) );
			return result;
		}
		
	}
}