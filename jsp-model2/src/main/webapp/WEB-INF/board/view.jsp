<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">글보기</h2>
    <table class="table">
        <colgroup>
            <col style="width: 150px">
            <col>
        </colgroup>
        <tbody>
            <tr>
                <th class="bg-gradient">SUBJECT</th>
                <td>${boardDto.subject}</td>
            </tr>
            <tr>
                <th class="bg-light">CONTENT</th>
                <td class="content">${boardDto.content}</td>
            </tr>
        </tbody>
    </table>
</div>
<script src="http://cdn.iframe.ly/embed.js?api_key=c9f743c0307f13e086a80b"></script>
<script>
    document.querySelectorAll("oembed[url]").forEach(element=>{
        iframely.load(element,element.attributes.url.value)
    });
</script>
<%@ include file="../include/footer.jsp"%>
