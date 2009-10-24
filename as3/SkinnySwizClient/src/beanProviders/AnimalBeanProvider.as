package beanProviders
{
	import views.animals.CatView;
	import views.animals.DogView;
	
	public class AnimalBeanProvider
	{
		public var myDogView:DogView = new DogView();
		public var myCatView:CatView = new CatView();
		
		public function AnimalBeanProvider()
		{
			super();
		}
	}
}