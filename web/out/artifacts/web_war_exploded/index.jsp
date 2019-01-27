<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <form name="bmiForm" action="bim" method="post">
    <table>
      <tr>
        <td>体重</td>
        <td><input type="text" name="weight" /></td>
      </tr>
      <tr>
        <td>身高</td>
        <td><input type="text" name="height" /></td>
      </tr>
      <tr>
        <th><input type="submit" value="提交" name="find" /></th>
        <th><input type="reset" value="重置" name="reset" /></th>
      </tr>
    </table>
    <h1>${bim}</h1>
    <h1>${result}</h1>
  </form>

  </body>
</html>