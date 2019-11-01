<#import "common.ftl" as c/>
<@c.log>
</@c.log>
<@c.page>
    <div class="reverse">
        <ul>
            <#list posts?reverse as post>
                <li> <@c.postlink post=post isNotFull="isNotFull"/> </li>
                </#list>
        </ul>
    </div>
</@c.page>