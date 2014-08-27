function createDepartment()
{
	//alert("Jtable");
	$('#department').jtable(
	{
		title : 'Departments',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/department/index',
			createAction : '/department/create',
			updateAction : '/department/update',
			deleteAction : '/department/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#department').jtable('selectedRows');
					$('#department').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#department').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#department').jtable('load',
					{
						name : $('#name').val(),
						department_id : $('#department_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}


function createStatus()
{
	//alert("Jtable");
	$('#status').jtable(
	{
		title : 'Statues',
		paging : true, //Set paging enabled
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/status/index',
			createAction : '/status/create',
			updateAction : '/status/update',
			deleteAction : '/status/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#status').jtable('selectedRows');
					$('#status').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#status').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#status').jtable('load',
					{
						name : $('#name').val(),
						status_id : $('#status_id').val(),
						
					});
					$('#name').val('');
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}
// **************** Priority **********************
function createPriority()
{
	//alert("Jtable");
	$('#priority').jtable(
	{
		title : 'Priorities',
		paging : true, //Set paging enabled
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/priority/index',
			createAction : '/priority/create',
			updateAction : '/priority/update',
			deleteAction : '/priority/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#priority').jtable('selectedRows');
					$('#priority').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#priority').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#priority').jtable('load',
					{
						name : $('#name').val(),
						status_id : $('#priority_id').val(),
						
					});
					$('#name').val('');
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createCategory()
{
	//alert("Jtable");
	$('#category').jtable(
	{
		title : 'Categories',
		paging : true, //Set paging enabledN
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/category/index',
			createAction : '/category/create',
			updateAction : '/category/update',
			deleteAction : '/category/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#category').jtable('selectedRows');
					$('#category').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#category').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#category').jtable('load',
					{
						name : $('#name').val(),
						category_id : $('#category_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createEnterpriseApplication()
{
	//alert("Jtable");
	$('#enterprise').jtable(
	{
		title : 'Applications',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/enterprise_application/index',
			createAction : '/enterprise_application/create',
			updateAction : '/enterprise_application/update',
			deleteAction : '/enterprise_application/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#enterprise').jtable('selectedRows');
					$('#enterprise').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#enterprise').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#enterprise').jtable('load',
					{
						name : $('#name').val(),
						enterprise_id : $('#enterprise_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createTicket()
{
	//alert("Jtable");
	$('#ticket').jtable(
	{
		title : 'Tickets',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		//sorting : true, //Enable sorting
		//defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/ticket/index',
			createAction : '/ticket/create',
			updateAction : '/ticket/update'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			category_id :
			{
				title : ' Catagory',
				options : '/ticket/catagoryOption'
				
			},
			department_id :
			{
				title : 'Department',
				options : '/ticket/departmentOption'
				
			},
			priority_id :
			{
				title : 'Priority',
				options : '/ticket/priorityOption'
			},
			application_id :
			{
				title : 'Application',
				options : '/ticket/applicationOption'
			},
			assigned_on :
			{
				title : 'Assigned on'
			},
			short_description :
			{
				title : 'Description'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#department').jtable('selectedRows');
					$('#ticket').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#ticket').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#ticket').jtable('load',
					{
						category_id : $('#name').val(),
						ticket_id : $('#ticket_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createRole()

{
	alert("Jtable");
	$('#role').jtable(
	{
		title : 'Roles',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/roles/index',
			createAction : '/roles/create',
			updateAction : '/roles/update',
			deleteAction : '/roles/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#role').jtable('selectedRows');
					$('#role').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#role').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#role').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#role').jtable('load',
					{
						name : $('#name').val(),
						role_id : $('#role_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createUser()
{
	//alert("Jtable");
	$('#user').jtable(
	{
		title : 'Users',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/users/index',
			createAction : '/users/create',
			updateAction : '/users/update',
			deleteAction : '/users/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			firstname :
			{
				title : 'First Name',
				width : '10%'
			},
			lastname :
			{
				title : ' Last Name',
				width : '10%'
			},
			email :
			{
				title : ' Email',
				width : '10%'
			},
			role_id :
			{
				title : 'Role',
				 options : '/users/roleOption'
				
			},
			group_id :
			{
				title : 'Group',
				options : '/users/groupOption'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#user').jtable('selectedRows');
					$('#user').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#user').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#user').jtable('load',
					{
						firstname : $('#firstname').val(),
						user_id : $('#user_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}

function createGroup()
{
	alert("Jtable");
	$('#group').jtable(
	{
		title : 'Groups',
		paging : true, //Set paging enabled
		pageSize: 10, //Set page size (default: 10)
		sorting : true, //Enable sorting
		defaultSorting : 'name', //Sort by  by default
		selecting : true, //Enable selecting ** To create checkboxes next 2 options are needed ***
		multiselect : true, //Allow multiple selecting
		selectingCheckboxes : true, //Show checkboxes on first column
		ajaxSettings :
		{
			type : 'GET',
			dataType : 'json'
		},

		actions :
		{
			listAction : '/groups/index',
			createAction : '/groups/create',
			updateAction : '/groups/update',
			deleteAction : '/groups/destroy'

		},
		fields :
		{
			id :
			{
				title : 'ID',
				key : true,
				list : true
			},
			name :
			{
				title : ' Name',
				width : '10%'
			}
		},

		toolbar :
		{
			items : [
			{
				//icon : '/images/excel.png',
				text : 'Delete Selected Items',
				cssClass : 'deleteButton',

				click : function()
				{
					//perform your custom job...
					var $selectedRows = $('#department').jtable('selectedRows');
					$('#department').jtable('deleteRows', $selectedRows);
				}
			}]

		},
		//Register to selectionChanged event to hanlde events
		selectionChanged : function()
		{
			//Get all selected rows
			var $selectedRows = $('#department').jtable('selectedRows');
			//alert($selectedRows.length);
			$('#SelectedRowList').empty();
			if ($selectedRows.length > 0)
			{
				$('#DeleteAllButton').show();
				$('.deleteButton').show();

			}
			else
			{

				$('.deleteButton').hide();
			}
		},
	});
	$('.deleteButton').hide();
	//$('#department').jtable('load');
	
	//Search 

					//Re-load records when user click 'load records' button.
				$('#LoadRecordsButton').click(function(e)
				{
					e.preventDefault();
					$('#department').jtable('load',
					{
						name : $('#name').val(),
						department_id : $('#department_id').val(),
						
					});
				});

				//Load all records when page is first shown
				
				$('#LoadRecordsButton').click();

}