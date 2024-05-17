<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-17
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    // front에서 변수 전달하고 서버에서 받아서 db처리
    int no = 0;
    String strNo = request.getParameter("no");
    if (strNo != null) {
        no = Integer.parseInt(request.getParameter("no"));
    }

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    boolean isUpdate = true;
    String visitedCookieValue = CookieManager.readCookie(request, "visitedCookie");
    if (visitedCookieValue.isBlank()) {
        CookieManager.createCookie(response, "visitedCookie", strNo, 60 * 60 * 24);
    } else {
        // 13/12/3/1/2 한번 방문했음
        if(visitedCookieValue.contains(strNo)) {
            isUpdate=false;
        } else {
            isUpdate=true;
            CookieManager.deleteCookie(response,"visitedCookie");
            CookieManager.createCookie(response,"visitedCookie",
                    visitedCookieValue+"/"+strNo,60*60*24);
        }
    }

    if (isUpdate) {
        String updateSql = "update board set hit = hit + 1 where no = ?";
        jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(updateSql);
        jdbcConnectionPool.pstmt.setInt(1, no);
        jdbcConnectionPool.pstmt.executeUpdate();
    }

    String sql = "select * from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1, no);
    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();


%>
<div class="container">
    <h2 class="mt-5 mb-5">VIEW</h2>
    <table class="table table-striped">
        <tbody>
        <% if (jdbcConnectionPool.rs.next()) { %>
        <tr>
            <td>제목</td>
            <td colspan="3"><%=jdbcConnectionPool.rs.getString("subject")%>
            </td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3"><%=jdbcConnectionPool.rs.getString("username")%>
            </td>
        </tr>
        <tr>
            <td>날짜</td>
            <td><%=jdbcConnectionPool.rs.getString("regdate")%>
            </td>
            <td>조회수</td>
            <td><%=jdbcConnectionPool.rs.getInt("hit")%>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content">
                <%=jdbcConnectionPool.rs.getString("content")%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <div class="mt-5 mb-5">
        <a href="../board/write.jsp" class="btn btn-primary">WRITE</a>
        <a href="../board/list.jsp" class="btn btn-primary">LIST</a>
        <%--글쓴인만 두가지 메뉴가 보이게 처리...  jjang051 == rs.--%>
        <% if(loggedID!=null &&
                loggedID.equals(jdbcConnectionPool.rs.getString("userid"))) { %>
            <a href="../board/delete.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>" class="btn btn-danger">DEL</a>
            <button class="btn btn-danger" id="btn-form-del">DEL-FORM</button>
            <button class="btn btn-danger" id="btn-form-del-ajax"
                    data-no="<%=jdbcConnectionPool.rs.getInt("no")%>">DEL-AJAX</button>
            <a href="../board/delete-form.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>"
               class="btn btn-danger" id="">PASSWORD-SEND</a>
            <button class="btn btn-danger" id="btn-password-popup">PASSWORD-POPUP</button>

        <a href="../board/list.jsp" class="btn btn-danger">MODIFY</a>
        <% } %>
    </div>
    <form action="../board/delete.jsp" method="post" id="del-form">
        <input type="hidden" name="no" value="<%=jdbcConnectionPool.rs.getInt("no")%>">
    </form>
    <script>
        //form바깥에 있는 버튼에서 form submit()을 할 수 있다.
        $("#btn-form-del").on("click",function(){
            $("#del-form").submit();
        })
        $("#btn-form-del-ajax").on("click",function(){
            const sendNo = $(this).data("no");
            $.ajax({
                url:"../board/delete-ajax.jsp",
                data: {
                    no:sendNo,
                },
                success:function(data) {
                    console.log(data);
                    if(data.isDelete==="yes") {
                        alert(sendNo+"글이 삭제되었습니다.");
                        location.href="../board/list.jsp";
                    } else {
                        alert("알 수 없는 에러가 발생되었습니다. 다시 시도해 주세요.");
                    }
                },
                error:function(err) {
                    console.log(err);
                }
            });
        })
    </script>
    <% jdbcConnectionPool.close(); %>
</div>
<div class="modal fade" id="password-modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">PASSWORD</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="userPW">PASSWORD</label>
                <input type="password" id="userPW" class="form-control mt-2" name="userPW">
                <input type="hidden" id="board-no" name="no" value="${param.no}">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btn-delete">DELETE</button>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btn-password-popup").on("click",function(){
        const passwordModal = new bootstrap.Modal("#password-modal");
        passwordModal.show();
    });
    $("#btn-delete").on("click",function(){
        const sendPw = $("#userPW").val();
        const sendNo = $("#board-no").val();
        console.log(sendNo,"===",sendPw);
        $.ajax({
            url:"../board/delete-ajax-popup.jsp",
            method:"post",
            data: {
                no:sendNo,
                userPW:sendPw
            },
            success:function(data) {
                console.log(data);
                if(data.isDelete==="yes") {
                    //alert(sendNo+"글이 삭제되었습니다.");
                    location.href="../board/list.jsp";
                } else {
                    //alert("알 수 없는 에러가 발생되었습니다. 다시 시도해 주세요.");
                }
            },
            error:function(err) {
                console.log(err);
            }
        });
    })


</script>
<%@ include file="../include/footer.jsp" %>
