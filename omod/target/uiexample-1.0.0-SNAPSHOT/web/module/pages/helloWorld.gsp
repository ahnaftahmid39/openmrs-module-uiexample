Hello, world.

<% if (context.authenticated) { %>
    And a special hello to you, ${context.authenticatedUser.personName.fullName}....
    <br>
    Your roles are:
    <ul>

    <% context.authenticatedUser.roles.findAll { !it.retired }.each { %>
        <li> ${it.role} (${it.description}) </li>
    <% } %>
    </ul>
<% } else { %>
    You are not logged in.
<% } %>

${ ui.includeFragment("uiframework", "helloUser") }

${ ui.includeFragment("uiexample", "encountersToday",
        [   start: "2011-02-16 23:59:59.999",
            end: "2025-02-16 23:59:59.999",
            properties: ["location", "encounterDatetime"],
            decoratorProvider: "uiexample",
            decorator: "widget",
            decoratorConfig: [title: "Today's Encounters"]
        ]) }

<div
    style= "display: flex;
            padding: 2rem;
            align-items: center;
            /*justify-content: center;*/
            font-size: 2rem;"
>
    ${ ui.message("uiexample.message.simple") }
</div>


<div>
    ${ui.getClass()}
</div>
