<#-- @ftlvariable name="user_id" type="java.lang.Long" -->
<#import "common.ftl" as c/>

<@c.log>
</@c.log>
<@c.page>
    <ul>
        <#if user_id??>
            <#list posts?sort_by("user_id") as p>
            <#if p?? && p.id == user_id>
                <@c.postlink post=p isNotFull="isNotFull"/>
                    </#if>
                </#list>
        </#if>
    </ul>
</@c.page>
