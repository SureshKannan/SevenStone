// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require respond
//= require turbolinks
//= require_tree .
// 

function openNewWindow(url,title)
{
	try
	{
	  page = $("#page").val();
	  $("#myModalLabel").html("New " + title);
	  $("#newdialog").attr('src',url + '?mode=new&page='+page);
	  $('#myDialogBox').modal("show");
	}
	catch(err)
	{
		alert(err.description);
	}
}	

function selectRows()
{
	var selected = $("#selectAll").prop("checked");
	if (selected)
		$("input:checkbox").prop("checked",true);
	else
		$("input:checkbox").prop("checked",false);	
}

function closeWindow(id)
{
	$('#'+id).addClass('normalRow');		  			
	$('#myDialogBox').modal("hide");
}
function setMode(mode)
{
	$('#mode').val(mode);
}		

function openEditWindow(url,id,title)
{
	if ($('#'+id).hasClass('highlightRow')==false)
	$('#'+id).addClass('highlightRow');
	id = id.replace('r','');
	$("#myModalLabel").html("Edit " + title);
	$("#newdialog").attr('src',url + '/'+id+'/edit?mode=edit');
	$('#myDialogBox').modal("show");
}

//updating the data
function updateData(mode,data,rowid)
{
	if (mode=="new")
	{
		// $(".dataTable > tbody:last").append(data);
		$("#roles").html(data);
		$('.pagination a').attr('data-remote', 'true');
	}
	else
	{
	$("#" + rowid).replaceWith(data);
	}

}

	