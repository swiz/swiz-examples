package models.presentation
{
	public interface IMainPresentationModel
	{
		function get activeView():int;
		
		function setActiveView( index:int ):void;
	}
}