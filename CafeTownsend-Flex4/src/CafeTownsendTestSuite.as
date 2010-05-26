package 
{

	import com.cafetownsend.domain.test.*;
	import com.cafetownsend.presentation.test.*;
	import com.cafetownsend.util.test.EmployeeUtilTest;

	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class CafeTownsendTestSuite
	{
		//
		// utils
		public var employeeUtil:EmployeeUtilTest;
		//
		// domain models
		public var employee: EmployeeTest;
		public var user:UserTest;
		
		//
		// presentation models
		public var loginPresentationModelTest: LoginPresentationModelTest;
		public var mainViewPresentationModelTest: MainViewPresentationModelTest;
		
		public var employeesPresentationModelTest: EmployeesPresentationModelTest;
		public var employeeDetailPresentationModelTest: EmployeeDetailPresentationModelTest;
		public var employeeListPresentationModelTest: EmployeeListPresentationModelTest;
		
		
		
	}
}