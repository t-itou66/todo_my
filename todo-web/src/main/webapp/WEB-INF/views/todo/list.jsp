<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Todo List</title>
<style type="text/css">
.strike {
    text-decoration: line-through;
}

.inline {
    display: inline-block;
}

.alert {
    border: 1px solid;
}

.alert-error {
    background-color: #c60f13;
    border-color: #970b0e;
    color: white;
}

.alert-success {
    background-color: #5da423;
    border-color: #457a1a;
    color: white;
}
.text-error {
    color: #ff0f13;
}
</style>
</head>
<body>
    <h1>Todo List</h1>
    <div id="todoForm">
    <!-- (1) -->
    <t:messagesPanel />

    <!-- (2) -->
    <form:form
       action="${pageContext.request.contextPath}/todo/create"
        method="post" modelAttribute="todoForm">
        <form:input path="todoTitle" /><!-- (3) -->
        <form:errors path="todoTitle" cssClass="text-error" /><!-- (4) -->
        <form:button>Create Todo</form:button>
    </form:form>
    </div>
    <hr />
    <div id="todoList">
        <ul>
            <!-- (1) -->
            <c:forEach items="${todos}" var="todo">
                <li><c:choose>
                        <c:when test="${todo.finished}"><!-- (2) -->
                            <span class="strike">
                            <!-- (3) -->
                            ${f:h(todo.todoTitle)}
                            </span>
                        </c:when>
                        <c:otherwise>
                            ${f:h(todo.todoTitle)}
                            <form:form
                               action="${pageContext.request.contextPath}/todo/finish"
                               method="post"
                               modelAttribute="todoForm"
                               cssClass="inline">
                               <form:hidden path="todoId"
                                   value="${f:h(todo.todoId)}" />
                               <form:button>Finish</form:button>
                            </form:form>
                         </c:otherwise>
                    </c:choose>
                    <form:form
                        action="${pageContext.request.contextPath}/todo/delete"
                        method="post" modelAttribute="todoForm"
                        cssClass="inline">
                        <!-- (2) -->
                        <form:hidden path="todoId"
                            value="${f:h(todo.todoId)}" />
                        <form:button>Delete</form:button>
                    </form:form>
                    </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>