package com.cafetownsend.controller
{
	import com.cafetownsend.business.IEmployeeDelegate;
	import com.cafetownsend.domain.Employee;
	import com.cafetownsend.model.EmployeeModel;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceRequestUtil;
	
	public class EmployeeController
	{
		[Inject]
		public var model:EmployeeModel;
		
		[Inject]
		public var delegate:IEmployeeDelegate;
		
		[Inject]
		public var serviceRequestUtil:ServiceRequestUtil;
		
		public function EmployeeController()
		{
		}
		
		[Mediate(event="loginComplete")]
		public function loginCompleteHandler():void
		{
			var call:AsyncToken = delegate.loadEmployees();
			serviceRequestUtil.executeServiceCall(call, loadEmployeeHandler);
		}
		
		protected function loadEmployeeHandler(event:ResultEvent):void
		{
			model.employees = event.result as IList;
		}
		
		[Mediate(event="EmployeeEvent.CREATE", properties="employee")]
		public function createEmployee(employee:Employee):void
		{
			var call:AsyncToken = delegate.createEmployee(employee);
			serviceRequestUtil.executeServiceCall(call, createEmployeeResultHandler);
		}
		
		protected function createEmployeeResultHandler(event:ResultEvent):void
		{
			model.employees.addItem(event.result as Employee);
		}
		
		[Mediate(event="EmployeeEvent.UPDATE", properties="employee")]
		public function updateEmployee(employee:Employee):void
		{
			var call:AsyncToken = delegate.updateEmployee(employee);
			serviceRequestUtil.executeServiceCall(call, updateEmployeeResultHandler);
		}
		
		protected function updateEmployeeResultHandler(event:ResultEvent):void
		{
			// TODO implement updateEmployeeResultHandler
		}
		
		[Mediate(event="EmployeeEvent.DELETE", properties="employee")]
		public function deleteEmployee(employee:Employee):void
		{
			var call:AsyncToken = delegate.deleteEmployee(employee);
			serviceRequestUtil.executeServiceCall(call, deleteEmployeeResultHandler, null, [employee]);
		}
		
		protected function deleteEmployeeResultHandler(event:ResultEvent, employee:Employee):void
		{
			var index:int = model.employees.getItemIndex(employee);
			model.employees.removeItemAt(index);
		}
	
	}
}