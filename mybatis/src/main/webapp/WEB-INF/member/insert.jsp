<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">회원가입</h2>
    <%--서버내에 있는 resource에 있는 것들은 사용 가능--%>

    <form action="../member/insert" method="post"
          enctype="multipart/form-data">
        <div class="mb-3">
            <label for="userID" class="form-label">USER ID</label>
            <input type="text" class="form-control" id="userID" placeholder="user id" name="userID">
            <button type="button" id="btn-duplicate" class="btn btn-dark mt-2">아이디 중복 체크</button>
            <%--<a href="" id="btn-duplicate02" class="btn btn-dark mt-2">아이디 중복 체크</a>--%>
        </div>
        <div class="mb-3">
            <label for="userPW" class="form-label">PASSWORD</label>
            <input type="password" class="form-control" id="userPW" placeholder="password" name="userPW">
            <div class="invalid-feedback"></div>
        </div>
        <div class="mb-3">
            <label for="userPW02" class="form-label">PASSWORD CONFIRM</label>
            <input type="password" class="form-control" id="userPW02" placeholder="password">
        </div>

        <div class="mb-3">
            <label for="userName" class="form-label">USER NAME</label>
            <input type="text" class="form-control" id="userName" placeholder="user name" name="userName">
        </div>

        <div class="mb-3">
            <label for="userEmail" class="form-label">USER EMAIL</label>
            <input type="email" class="form-control" id="userEmail" placeholder="user email" name="email">
        </div>

        <div class="mb-3">
            <label for="postCode" class="form-label" >POST CODE</label>
            <div class="row">
                <div class="col-auto"><input type="text" class="form-control" id="postCode" placeholder="post code" name="postCode"></div>
                <div class="col-auto px-0"><button type="button" id="btn-postcode" class="btn btn-dark">우편번호 찾기</button></div>
            </div>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">ADDRESS</label>
            <input type="text" class="form-control" id="address" placeholder="address" name="address" readonly>
        </div>
        <div class="mb-3">
            <label for="detail-address" class="form-label">DETAIL ADDRESS</label>
            <input type="text" class="form-control" id="detail-address" placeholder="detail address" name="addressDetail">
        </div>
        <div class="mb-3">
            <label for="birth" class="form-label">BIRTH</label>
            <input type="date" class="form-control" id="birth" placeholder="select birth day" name="birth">
        </div>
        <div class="mb-3">
            <label for="profile" class="form-label">PROFILE</label>
            <input class="form-control" type="file" id="profile"
                   name="profile" accept="image/gif,image/jpg,image/png">
        </div>
        <div class="mb-3">
            <div id="preview">미리보기 이미지 들어가는 곳</div>
        </div>
        <div>
            <button class="btn btn-primary" id="btn-sign">SIGN IN</button>
            <button class="btn btn-outline-primary" type="reset">RESET</button>
        </div>
    </form>

</div>
<%--<div class="a" style="width:300px; height: 300px ; border: 1px solid #000;">
    a
    <div class="b" style="width:200px; height: 200px; border: 1px solid #000;">
        b
        <div class="c"  style="width:100px; height: 100px; border: 1px solid #000;">c</div>
    </div>
</div>--%>
<script>
    let isIdChecked=false;
    $("#btn-sign").on("click",function(){
        if($("#userID").val().trim()===""){
            alert("id는 필수입력 사항입니다.");
            $("#userID").focus();
            return false;
        }
        if($("#userPW").val().trim()===""){
            alert("password는 필수입력 사항입니다.");
            $("#userPW").focus();
            return false;
        }
        if($("#userName").val().trim()===""){
            alert("이름는 필수입력 사항입니다.");
            $("#userName").focus();
            return false;
        }

        if($("#userEmail").val().trim()===""){
            alert("email은 필수입력 사항입니다.");
            $("#userEmail").focus();
            return false;
        }
        if($("#postCode").val().trim()===""){
            alert("우편번호는 필수입력 사항입니다.");
            $("#postCode").focus();
            return false;
        }
        if($("#address").val().trim()===""){
            alert("주소는 필수입력 사항입니다.");
            $("#address").focus();
            return false;
        }
        if($("#userPW").val()!==$("#userPW02").val()) {
            alert("패스워드가 맞지 않습니다.");
            $("#userPW02").focus();
            return false;
        }
        if(!isIdChecked){
            alert("아이디 중복체크해주세요.");
            $("#userID").focus();
            return false;
        }
    });
    $("#userPW02").on("keyup",function(e) {
        //console.log("키를 눌렀다 뗐습니다.");
        if($("#userPW02").val()!==$("#userPW").val()) {
            $(".invalid-feedback").text("password가 맞질 않습니다.");
            $(".invalid-feedback").show();
        } else {
            $(".invalid-feedback").text("");
            $(".invalid-feedback").hide();
        }
    })
    //ajax - jquery axios fetch
    $("#btn-duplicate").on("click",function(){
        $.ajax({
            url:"../member/id-check",
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
                        isIdChecked=true;
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
                        isIdChecked=true;
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
    $("#btn-postcode").on("click",makePostCode);
    function makePostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ""; // 주소 변수
                let extraAddr = ""; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //$("#detail-address").val(extraAddr);

                } else {
                    //$("#detail-address").val("");
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#postCode").val(data.zonecode);
                $("#address").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#detail-address").focus();
            }
        }).open();
    }
    // idCheck가 되지 않으면 못날아가게
    // password 맞지 않으면 못날아가게
    $("#profile").on("change",function(e){
        //console.log(e);
        //console.log(e.currentTarget.files[0]);
        const file = e.currentTarget.files[0];
        //"fdfkdsk.lfd.mp3"
        if (!file) { // 파일이 선택되지 않은 경우
            $("#preview").html(""); // 미리보기 영역 비우기
            return false;
        }
        const extension =
            file.name.substring(file.name.lastIndexOf(".")+1).toLowerCase();
        //console.log(file);

        if(!(extension==="png" || extension==="jpg" || extension==="gif")) {
            alert("이미지 파일만 업로드 가능합니다.");
            $(this).val("");
            return false;
        } else {
            const profileReader = new FileReader();
            profileReader.addEventListener("load",function(e){
                console.log(e);
                const img = e.currentTarget.result;
                $("#preview").html(`<img src="\${img}">`);
            });
            profileReader.readAsDataURL(file);
        }
    })
    /*
    //만약에 새로 생성되는 item
    $(".a").on("click",function(e) {
        console.log(e.currentTarget);
        console.log(e.target);
        $("body")
            .append("<div class='d' style='width:100px; height: 100px; border: 1px solid #000;'>d</div>")
    });
    //이벤트 위임
    $("body").on("click",".d",function(e) {
        console.log("ddd");
    });
     */
</script>
<%@ include file="../include/footer.jsp"%>