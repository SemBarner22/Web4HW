<#macro header>
<header>
    <a href="/"><img src="/img/logo.png" alt="Codeforces" title="Codeforces"/></a>
    <div class="languages">
        <a href="#"><img src="/img/gb.png" alt="In English" title="In English"/></a>
        <a href="#"><img src="/img/ru.png" alt="In Russian" title="In Russian"/></a>
    </div>
    <div class="enter-or-register-box">
        <#if user??>
            <@nameOnly user=user/>
            |
            <a href="#">Logout</a>
        <#else>
            <a href="#">Enter</a>
            |
            <a href="#">Register</a>
        </#if>
    </div>
    <nav>
        <ul>
            <#if place==0>
                <li style="border-bottom: 3rem black"><a class="current" href="/index">Index</a></li>
                <#else>
                <li><a href="/index">Index</a></li>
            </#if>
            <#if place==1>
                <li  style="border-bottom: 3rem black"><a class="current" href="/index" style="text-decoration-color: red">Help</a></li>
            <#else>
                <li><a href="/misc/help">Help</a></li>
            </#if>
            <#if place==2>
                <li  style="border-bottom: 3rem black"><a class="current" href="/users" style="text-decoration-color: red">Users</a></li>
            <#else>
                <li  style="border-bottom: 3rem black"><a href="/users" style="text-decoration-color: red">Users</a></li>
            </#if>
        </ul>
    </nav>
</header>
</#macro>

<#macro footer>
<footer>
    <a href="#">Codeforces</a> &copy; 2010-2019 by Mike Mirzayanov
</footer>
</#macro>

<#macro log>
    <#if logged_user_id?has_content>
        <#if c.findBy(users, "id", logged_user_id)??>
            <#assign user=c.findBy(users, "id", logged_user_id)!/>
            <#assign user_id=logged_user_id!/>
        </#if>
    </#if>
</#macro>

<#macro sidebar>
    <ul class="attention">
            <#list posts as post>
                <aside>
                <section>
                <#assign posyNum=findByIndex(posts, "id", post.id)!/>
                <div class="header">
                   Post #${post.id}
                </div>
                <div class="body">
                    <@postlink post=post isNotFull="isNotFull"/>
                </div>
                <div class="footer">
                    <a href="/post?post_id=${post.id}">View all</a>
                </div>
                </section>
                </aside>
            </#list>
    </ul>
</#macro>

<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Codeforces</title>
    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/post.css">
    <link rel="icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
</head>

<body>
    <@header/>
    <div class="middle">
        <@sidebar/>
        <main>
            <#nested/>
        </main>
    </div>
    <@footer/>
</body>
</html>
</#macro>


<#macro usertable users>
    <link rel="stylesheet" type="text/css" href="/css/usertable.css">
    <div class="middle">
        <main>
            <div class="datatable">
                <div class="caption">Users</div>
                <table>
                    <thead>
                    <tr>
                        <th>User</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list users as u>
                    <tr>
                        <td><#if user?? && u.id == user.id>*</#if> <@c.userlink user=u/></td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</#macro>

<#macro userlink user>
    <div class="${user.color}">
        <a href="/user?handle=${user.handle}">${user.name}</a>
    </div>
</#macro>

<#macro nameOnly user>
    <a href="/user?handle=${user.handle}">${user.name}</a>
</#macro>

<#macro postlink post isNotFull>
<div class="middlePost">
    <link rel="stylesheet" type="text/css" href="/css/post.css">
    <main>
        <article>
            <div class="title">${post.title}</div>
            <div class="information">${post.user_id}</div>
            <#if isNotFull=="isNotFull">
                <div class="body">${post.text?truncate(250)}</div>
            <#else>
                <div class="body">${post.text}</div>
            </#if>

            <ul class="attachment">
                <li>Announcement of <a href="#">Codeforces Round #510 (Div. 1)</a></li>
                <li>Announcement of <a href="#">Codeforces Round #510 (Div. 2)</a></li>
            </ul>
            <div class="footer">
                <div class="left">
                    <img src="img/voteup.png" title="Vote Up" alt="Vote Up"/>
                    <span class="positive-score">+173</span>
                    <img src="img/votedown.png" title="Vote Down" alt="Vote Down"/>
                </div>
                <div class="right">
                    <img src="img/date_16x16.png" title="Publish Time" alt="Publish Time"/>
                    2 days ago
                    <img src="img/comments_16x16.png" title="Comments" alt="Comments"/>
                    <a href="#">68</a>
                </div>
            </div>
        </article>
    </main>
</div>
</#macro>

<#macro userlinkId user>
    <div class="${user.color}">
        <a href="/user?user_id=${user.id}">${user.name}</a>
    </div>
</#macro>

<#macro userrest user>
    <ul>
        <li>id: ${user.id}</li>
        <li>handle: ${user.handle}</li>
        <li>name: ${user.name}</li>
        <li>posts: <a href="/posts?user_id=${user.id}">here</a></li>
    </ul>
</#macro>

<#function findBy items key id>
    <#list items as item>
        <#if item[key]==id>
            <#return item/>
        </#if>
    </#list>
</#function>

<#function findByIndex items key id>
    <#list items as item>
        <#if item[key]==id>
            <#return item?index/>
        </#if>
    </#list>
</#function>

