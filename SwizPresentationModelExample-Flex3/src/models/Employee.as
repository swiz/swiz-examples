package models
{
	[Bindable]
	public class Employee
	{
		public var id:int;
		public var name:String;
		public var location:String;
		
		public function Employee( id:int, name:String, location:String )
		{
			this.id = id;
			this.name = name;
			this.location = location;
		}
	}
}