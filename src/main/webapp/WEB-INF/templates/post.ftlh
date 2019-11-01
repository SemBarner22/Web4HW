<#-- @ftlvariable name="post_id" type="java.lang.Long" -->
<#import "common.ftl" as c/>

<@c.log>
</@c.log>
<@c.page>

        <#assign viewedPost=c.findBy(posts, "id", post_id)!/>
        <#if viewedPost.id??>
            <@c.postlink post=viewedPost isNotFull="isFull"/>
        </#if>
</@c.page>