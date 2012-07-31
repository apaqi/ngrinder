<#if resultsub?exists>
	<INPUT type="hidden" id="input_process"  value="${resultsub.process!'&nbsp;'}">
	<INPUT type="hidden" id="input_thread" value="${resultsub.thread!'&nbsp;'}">
	<INPUT type="hidden" id="tpsChartData"  value="${resultsub.tpsChartData!}">
	
	<INPUT type="hidden" id="input_status" value='<#if resultsub.success?? && resultsub.success>SUCCESS<#else>FAIL'</#if>>
	
    <#list resultsub?keys as mKey>
		<#if mKey=='latestSample'>
			<div id="lsTableItem">
				<#assign item = resultsub[mKey]>   
				<#list item as statistics>
				<tr>
					<td>Test${statistics.testNumber!'&nbsp;'}</td>
					<td>
	        			${statistics.testDescription!'&nbsp;'}
					</td>
					<td>${statistics.TestsStr!'&nbsp;'}</td>
					<td>${statistics.ErrorsStr!'&nbsp;'}</td>
					<td>${statistics['Mean_Test_Time_(ms)']!'&nbsp;'}</td>
					<td>${statistics.TPS!'&nbsp;'}</td>
					<td>${statistics.Peak_TPS!'&nbsp;'}</td>
					<td>${statistics['Test_Time_Standard_Deviation_(ms)']!'&nbsp;'}</td>
				</tr>
				</#list>
			</div>
		</#if>
		<#if mKey=='accumulated'>
			<div id="asTableItem">
				<#assign item = resultsub[mKey]>   
				<#list item as statistics>
				<tr>
					<td>Test${statistics.testNumber!'&nbsp;'}</td>
					<td>
						<div style="width:100px;white-space:nowrap;">
						<#if statistics.testDescription?has_content && statistics.testDescription?length gt 25>
	        				${statistics.testDescription?substring(0,24)}...
	      				<#else>
	        				${statistics.testDescription!'&nbsp;'}
						</#if>
						
					</td>
					<td>${statistics.TestsStr!'&nbsp;'}</td>
					<td>${statistics.ErrorsStr!'&nbsp;'}</td>
					<td>${statistics['Mean_Test_Time_(ms)']!'&nbsp;'}</td>
					<td>${statistics.TPS!'&nbsp;'}</td>
					<td>${statistics.Peak_TPS!'&nbsp;'}</td>
					<td>${statistics['Test_Time_Standard_Deviation_(ms)']!'&nbsp;'}</td>
				</tr>
				</#list>
			</div>
		</#if>
	</#list>
</#if>