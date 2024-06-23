<%
    ui.includeJavascript("uiexample", "custom.js")
    ui.includeJavascript("uiexample", "jquery.js")
    def id = config.id ?: "default"
    def props = config.properties ?: ["encounterType", "encounterDatetime", "location", "provider"]
%>
<%= ui.resourceLinks() %>


<input id="${ id }_button" type="button" value="Refresh"/>

<table id="${ id }">
    <thead>
    <tr>
        <% props.each { %>
        <th>${ ui.message("Encounter." + it) }</th>
        <% } %>
    </tr>
    </thead>
    <tbody>
    <% if (encounters) { %>
    <% encounters.each { enc -> %>
    <tr>
        <% props.each { prop -> %>
        <td><%= ui.format(enc."${prop}") %></td>
        <% } %>
    </tr>
    <% } %>
    <% } else { %>
    <tr>
        <td colspan="4">${ ui.message("general.none") }</td>
    </tr>
    <% } %>
    </tbody>
</table>
