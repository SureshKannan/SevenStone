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
