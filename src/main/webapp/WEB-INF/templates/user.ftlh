<#-- @ftlvariable name="handle" type="java.lang.String" -->
<#-- @ftlvariable name="user_id" type="java.lang.Long" -->
<#-- @ftlvariable name="logged_user_id" type="java.lang.Long" -->
<#import "common.ftl" as c/>

<#if logged_user_id?has_content>
    <#if c.findBy(users, "id", logged_user_id)??>
        <#assign user=c.findBy(users, "id", logged_user_id)!/>
<#--        <#assign user_id=logged_user_id!/>-->
    </#if>
</#if>
<@c.page>
    <link rel="stylesheet" type="text/css" href="css/user.css">
    <div class="tempBody">
        <#if handle??>
            <#assign viewedUser=c.findBy(users, "handle", handle)!/>
            <#assign curIndex=c.findByIndex(users, "handle", handle)!/>
            <#if viewedUser.id??>
                <img src="img/user.jpg" class="userjpg" align="right"/>
                <div class="usera">
                    <@c.userlink user=viewedUser/>
                </div>
                <@c.userrest user=viewedUser/>
            <#else>
                <h1>No such user</h1>
            </#if>
        <#elseif user_id??>
                <#assign viewedUserId=c.findBy(users, "id", user_id)!/>
                <#assign curIndex=c.findByIndex(users, "id", user_id)!/>
                <#if viewedUserId.id??>
                     <img src="img/user.jpg" class="userjpg" align="right"/>
                     <div class="userIda">
                        <@c.userlinkId user=viewedUserId/>
                    </div>
                    <@c.userrest user=viewedUserId/>
                <#else>
                    <h1>No such user</h1>
                </#if>
        <#else>
            <h1>No such user!!!!!</h1>
        </#if>
    </div>
    <#if viewedUser?has_content || viewedUserId?has_content>
        <div class="arrows">
            <ul>
                <#if users[curIndex]==users?first>
                    <li><a href="#" style="color: lightgray">←</a></li>
                <#else>
                    <li><a href="/user?handle=${users[curIndex - 1].handle}">←</a></li>
                </#if>
                <#if users[curIndex]==users?last>
                    <li><a href="#" style="color: lightgray">→</a></li>
                <#else>
                    <li><a href="/user?handle=${users[curIndex + 1].handle}">→</a></li>
                </#if>
        </div>
    </#if>
</@c.page>