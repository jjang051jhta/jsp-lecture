<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <h2 class="mt-5 mb-5">회원가입</h2>
        <form action="insert-member-process.jsp" method="post">
            <div class="mb-3">
                <label for="userID" class="form-label">USER ID</label>
                <input type="text" class="form-control" id="userID" placeholder="user id" name="userID">
                <button type="button" id="btn-duplicate" class="btn btn-dark mt-2">아이디 중복 체크</button>
                <a href="" id="btn-duplicate02" class="btn btn-dark mt-2">아이디 중복 체크</a>
            </div>

            <div class="mb-3">
                <label for="userPW" class="form-label">PASSWORD</label>
                <input type="password" class="form-control" id="userPW" placeholder="password" name="userPW">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label">USER NAME</label>
                <input type="text" class="form-control" id="userName" placeholder="user name" name="userName">
            </div>
            <div class="mb-3">
                <label for="birth" class="form-label">BIRTH</label>
                <input type="date" class="form-control" id="birth" placeholder="select birth day" name="birth">
            </div>
            <div>
                <button class="btn btn-primary">SIGN IN</button>
                <button class="btn btn-outline-primary" type="reset">RESET</button>
            </div>
        </form>
    </div>
<script>
    //ajax - jquery axios fetch
    $("#btn-duplicate").on("click",function(){
         $.ajax({
             url:"id-check-process.jsp",
             data: {
                 userID:$("#userID").val()
             },
             method:"post",
             success:function(data) {
                 console.log(data);
                 if(data.count>0) {
                     alert("쓸 수 없는 아이디입니다.");
                     $("#userID").val("");
                     $("#userID").focus();
                 } else {
                     const used = confirm("쓸 수 있는 아이디입니다. 사용하시겠습니까?");
                     if(used) {
                        $("#userID").attr("readonly",true);
                     } else {
                         $("#userID").val("");
                         $("#userID").focus();
                     }
                 }
             },
             fail:function(error) {
                 console.log(error);
             }
         });
    });
    $("#btn-duplicate02").on("click",function(e){
        //e.preventDefault();
        $.ajax({
            url:"id-check-process.jsp",
            data: {
                userID:$("#userID").val()
            },
            method:"post",
            success:function(data) {
                console.log(data);
                if(data.count>0) {
                    alert("쓸 수 없는 아이디입니다.");
                    $("#userID").val("");
                    $("#userID").focus();
                } else {
                    const used = confirm("쓸 수 있는 아이디입니다. 사용하시겠습니까?");
                    if(used) {
                        $("#userID").attr("readonly",true);
                    } else {
                        $("#userID").val("");
                        $("#userID").focus();
                    }
                }
            },
            fail:function(error) {
                console.log(error);
            }
        });
        return false;
    });
</script>
<%@ include file="../include/footer.jsp"%>
