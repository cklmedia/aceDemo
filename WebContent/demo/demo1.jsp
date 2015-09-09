<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 插入特有css -->
<link rel="stylesheet" href="./assets/css/jquery-ui.css" />

<!-- 上部位置导航条 -->
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
	</script>
	<ul class="breadcrumb">
		<li>
			<i class="ace-icon fa fa-home home-icon"></i>
			<a href="#">首页</a>
		</li>
		<li class="active">demo1</li>
	</ul><!-- /.breadcrumb -->
	
	<!-- 查询框 -->
	<div class="nav-search" id="nav-search">
		<form class="form-search">
			<span class="input-icon">
				<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
				<i class="ace-icon fa fa-search nav-search-icon"></i>
			</span>
		</form>
	</div>
</div>

<!-- 主要内容 -->
<div class="page-content">
	<!-- 导航栏样式自定义设置按钮 -->
	<%@ include file="../setting.jsp" %>
	
	<!-- 标题 -->
	<div class="page-header">
		<h1>
			表格demo1
			<small>
				<i class="ace-icon fa fa-angle-double-right"></i>
				简单
			</small>
		</h1>
	</div><!-- 标题 -->
						
	<div class="row">
		<div class="col-xs-12">
			<!-- 开始插入页面内容 -->
			
			<!-- 筛选 -->
			<div class="row">
				<div class="col-xs-12">
					<div id="accordion" class="accordion-style2">
						<div class="group">
							<h3 class="accordion-header">筛选</h3>
							<div>
								筛选表单
							</div>
						</div>
					</div><!-- #accordion -->
				</div>
			</div><!-- ./row -->
			
			<!-- 空隙 -->
			<div class="space-6"></div>
			
			<!-- 主要内容 -->
			<div class="row">
				<div class="col-xs-12">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</th>
								<th>Domain</th>
								<th>Price</th>
								<th class="hidden-480">Clicks</th>

								<th>
									<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
									Update
								</th>
								<th class="hidden-480">Status</th>

								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>
									<a href="#">ace.com</a>
								</td>
								<td>$45</td>
								<td class="hidden-480">3,330</td>
								<td>Feb 12</td>

								<td class="hidden-480">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td>
									<div class="hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="ace-icon fa fa-search-plus bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="ace-icon fa fa-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="ace-icon fa fa-trash-o bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>

						</tbody>
					</table>
				</div><!-- /.span -->
			</div><!-- /.row -->
		
			<!-- 插入页面内容结束 -->
		</div><!-- /.col -->
	</div><!-- /.row -->
	
</div><!-- /.page-content -->
<!-- 页面特有js -->
<script src="./assets/js/jquery-ui.js"></script>
<script src="./assets/js/jquery.ui.touch-punch.js"></script>
<script>
	jQuery(function($) {
		/* 表格全选 */
		$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
		//And for the first simple table, which doesn't have TableTools or dataTables
		//select/deselect all rows according to table header checkbox
		var active_class = 'active';
		$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
			var th_checked = this.checked;//checkbox inside "TH" table header
			
			$(this).closest('table').find('tbody > tr').each(function(){
				var row = this;
				if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
			});
		});
		//select/deselect a row when the checkbox is checked/unchecked
		$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
			var $row = $(this).closest('tr');
			if(this.checked) $row.addClass(active_class);
			else $row.removeClass(active_class);
		});
		
		/* 筛选 */
		$( "#accordion" ).accordion({
			active: false,
			collapsible: true ,
			heightStyle: "content",
			animate: 250,
			header: ".accordion-header"
		}).sortable({
			axis: "y",
			handle: ".accordion-header",
			stop: function( event, ui ) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
			}
		});
	});
</script>