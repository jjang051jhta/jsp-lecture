<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-21
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <h2 class="mt-5 mb-5">LIST</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>IDX</th>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>EMAIL</th>
                    <th>ADDRESS</th>
                    <th>DELETE</th>
                </tr>
            </thead>
            <tbody>
                <%--List에 담겨 있는 객체를 뽑아다 써야 하는데 그걸 변수 member--%>
                <%--varStatus는 반복문 돌때 그 환경 가르킴...--%>

                <c:forEach var="member" items="${memberList}" varStatus="loop">
                <tr class="align-middle">
                    <td>${loop.count}</td>
                    <td>${member.no}</td>
                    <td><a href="../member/info?userID=${member.userID}">${member.userID}</a></td>
                    <td>${member.userName}</td>
                    <td>${member.email}</td>
                    <td>${member.address}</td>
                    <td><button class="btn btn-danger btn-delete"
                                data-userid="${member.userID}">DEL</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        $(".btn-delete").on("click",function(){
            const sendUserID = $(this).data("userid");
            const parent = $(this).parent().parent();
            console.log(parent);
            console.log(sendUserID);
            $.ajax({
                url:"../member/delete-ajax",
                data: {
                    userID:sendUserID
                },
                method:"get",
                success:function(data) {
                    console.log(data);
                    console.log({"isDelete":"yes"});

                    if(data.isDelete==="yes") {
                        //tr 삭제
                        parent.remove();
                    }
                }
            })
        })
    </script>
<%@ include file="../include/footer.jsp" %>

