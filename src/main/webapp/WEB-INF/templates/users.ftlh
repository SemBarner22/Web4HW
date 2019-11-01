<#import "common.ftl" as c/>

<@c.log>
    </@c.log>
<@c.page>
    <@c.usertable users>
    </@c.usertable>
<#--<ul>
        <#list users as u>
        <li><#if user?? && u.id == user.id>*</#if> <@c.userlink user=u/>
            </#list>
    </ul>   -->
</@c.page>