<h2>系统状态 <span>System Status</span></h2>
<div class="row">
    <div class="col-md-6">
        <table id='instances' class="table table-bordered table-striped table-hover">
      <#if amazonInfo??>
        <tr>
            <td>Eureka Server</td>
            <td>AMI: ${amiId!}</td>
        </tr>
        <tr>
            <td>可用区域(Zone)</td>
            <td>${availabilityZone!}</td>
        </tr>
        <tr>
            <td>实例ID</td>
            <td>${instanceId!}</td>
        </tr>
      </#if>
            <tr>
                <td>运行环境</td>
                <td>${environment!}</td>
            </tr>
            <tr>
                <td>数据中心</td>
                <td>${datacenter!}</td>
            </tr>
        </table>
    </div>
    <div class="col-md-6">
        <table id='instances' class="table table-bordered table-striped table-hover">
            <tr>
                <td>当前时间</td>
                <td>${currentTime}</td>
            </tr>
            <tr>
                <td>已运行时间</td>
                <td>${upTime}</td>
            </tr>
            <tr>
                <td>已启用租约到期</td>
                <td>${registry.leaseExpirationEnabled?c}</td>
            </tr>
            <tr>
                <td>更新阈值</td>
                <td>${registry.numOfRenewsPerMinThreshold}</td>
            </tr>
            <tr>
                <td>更新（最后一分钟）</td>
                <td>${registry.numOfRenewsInLastMin}</td>
            </tr>
        </table>
    </div>
</div>


<#if isBelowRenewThresold>
    <#if !registry.selfPreservationModeEnabled>
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        更新比阈值更重要。 自我保存模式已关闭。 在网络/其他问题的情况下，这可能无法保护实例。
    </div>
    <#else>
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            紧急情况！Eureka可能错误地声称实例已经启动，而事实并非如此。续约低于阈值，因此实例不会为了安全而过期。
        </div>
    </#if>
<#elseif !registry.selfPreservationModeEnabled>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            自我保护模式已关闭。如果出现网络/其他问题，这可能无法保护实例过期。
        </div>
</#if>

<h2>注册中心数据同步(DS Replicas)</h2>
<ul class="list-group">
  <#list replicas as replica>
      <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
  </#list>
</ul>

