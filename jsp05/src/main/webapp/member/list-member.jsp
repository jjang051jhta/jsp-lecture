<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>

<script>
    //history.back() reload 이슈 해결
    if (document.addEventListener) {
        window.addEventListener("pageshow", function (event) {
            if (event.persisted || window.performance && window.performance.navigation.type == 2) {
                location.reload();
            }
        }, false);
    }
</script>
<div class="container">
    <h2 class="mt-5 mb-5">MEMBER LIST</h2>
    <form action="delete-member-process-all.jsp" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>no</th>
                <th>id</th>
                <th>name</th>
                <th>email</th>
                <th>delete</th>
                <th><input type="checkbox" id="check-all"></th>

            </tr>
            </thead>
            <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%=rs.getInt("no")%>
                </td>
                <td><%=rs.getString("userid")%>
                </td>
                <td><%=rs.getString("username")%>
                </td>
                <td><%=rs.getString("email")%>
                </td>
                <td>
                    <a href="../member/admin-delete-member-process.jsp?userID=<%=rs.getString("userid")%>"
                       class="btn btn-danger">DEL</a>
                    <button class="btn btn-danger btn-delete mx-1" type="button"
                            data-userid="<%=rs.getString("userid") %>">AJAX-DEL
                    </button>
                </td>
                <td><input type="checkbox" id="" name="check" value="<%= rs.getInt("no") %>" class="check"></td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <div class="mt-2">
            <button class="btn btn-danger btn-delete-all">DEL</button>
        </div>
    </form>
    <button class="btn btn-danger btn-delete-all02">삭제</button>
</div>
<script>
    // a href="데이터 처리할 서버 페이지?변수 = 값&변수 = 값"
    // form action="데이터 처리할 서버 페이지" name="변수" value="값" method="post/get"
    // ajax ( jquery ajax(), vanilla script fetch(), axios 라이브러리 유명함...)
    // 
    $(".btn-delete-all02").on("click",function() {
        $("#member-list-form").submit();
    });
    $(".btn-delete-all").on("click",function(e) {
        //e.preventDefault();
        const isAllDelete = confirm("삭제하시겠습니까?");
        if(isAllDelete) {
            $("#member-list-form").submit();
        }
        return false;
        //console.log(isAllDelete);
    })


    $(".btn-delete").on("click", function () {
        const parent = $(this).parent().parent();
        //alert("경고");
        const sendUserID = $(this).data("userid");
        //alert(sendUserID);
        $.ajax({
            url: "../member/admin-delete-member-ajax-process.jsp",
            data: {
                userID: sendUserID
            },
            success: function (data) {
                console.log(data);
                if (data.isDelete === "yes") {
                    //alert(sendUserID+"님을 탈퇴시겼습니다.");
                    //location.reload();
                    //parent.remove();
                    parent.fadeOut();
                }
            }
        });

    });

    $("#check-all").on("change", function () {
        //  속성의 값을 체크할때
        console.log($(this).prop("checked"));
        if ($(this).prop("checked")) {
            $(".check").prop("checked", true);
        } else {
            $(".check").prop("checked", false);
        }
        /*
        if($(this).is(":checked")) {
            $(".check").prop("checked",true);
        } else {
            $(".check").prop("checked",false);
        }
       */
    })
</script>
<%@ include file="../include/footer.jsp" %>
