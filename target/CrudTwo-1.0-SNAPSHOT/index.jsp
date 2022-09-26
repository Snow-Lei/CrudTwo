<%@ page
        language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"  rel="stylesheet" >
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="addModel_emp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Employee title</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="emp_from">
                    <div class="form-group">
                        <label for="inputEmail3"  class="col-sm-2 control-label" >empName</label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="empName" id="empName" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3"  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="email" id="inputEmail3" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">gender</label>
                        <label for="inputEmail3" class="col-sm-1 control-label"></label>
                        <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="M"> 女
                        </label>
                        <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="F" checked="checked"> 男
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">dept</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="dId" id="department_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_employee">保存</button>
            </div>
        </div>
    </div>
</div>
<%--................................................................................................................................--%>
<div class="modal fade" id="edit_Model_emp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel_edit">Employee title</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="emp_from_edit">
                    <div class="form-group">
                        <label for="inputEmail3"  class="col-sm-2 control-label" >empName</label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="empName" id="empName_edit" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3"  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="email" id="inputEmail3_edit" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">gender</label>
                        <label for="inputEmail3" class="col-sm-1 control-label"></label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="inlineRadio1_edit" value="M"> 女
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="inlineRadio2_edit" value="F"> 男
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">dept</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="dId" id="department_select_edit">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_employee_edit">保存</button>
            </div>
        </div>
    </div>
</div>
<%--................................................................................................................--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="add_emp_button_model"> 新增</button>
            <button class="btn btn-danger" >删除</button>

        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th >#</th>
                    <th >empName</th>
                    <th >gender</th>
                    <th >email</th>
                    <th >deptName</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <%--分页信息--%><%----%>
    <div class="row">
        <div class="col-md-6" id="emp_page_info"></div>
        <div class="col-md-6">
            <nav aria-label="Page navigation" id="Pagenavigationtwo">
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    var totalpage;
    var code_emp_empName=false;
    $(function (){

        to_page(1);

    });
    $("#empName").change(function (){
        var empName=$("#empName").val();
        var zzempName=/^[\u2E80-\u9FFFa-z0-9_-]{2,16}$/;
        $("#empName").parent().removeClass("has-error has-success");

        if(!zzempName.test(empName)){
            // alert("用户名格式错误！");
            $("#empName").parent().addClass("has-error");
            $("#empName").next("span").text("用户名格式错误！");
        }else {
            $("#empName").parent().addClass("has-success");
            $("#empName").next("span").text("");
            $.ajax({
                url:"${APP_PATH}/checkUser",
                type:"POST",
                data:"empName="+empName,
                success:function (result){
                    if(result.code!=100)
                    {
                        $("#empName").parent().removeClass("has-error has-success");
                        $("#empName").parent().addClass("has-error");
                        $("#empName").next("span").text("用户名已被占用！");
                        code_emp_empName=false;
                    }else {
                        code_emp_empName=true;
                    }
                }
            });

        };
    });

    /*inputEmail3*/


    $("#inputEmail3").change(function (){
        var email=$("#inputEmail3").val();
        var zzemail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        $("#inputEmail3").parent().removeClass("has-error has-success");
        if(!zzemail.test(email)){

            $("#inputEmail3").parent().addClass("has-error");
            $("#inputEmail3").next("span").text("邮箱格式错误！");
            // alert("邮箱格式错误！");


        }else {
            $("#inputEmail3").parent().addClass("has-success");
            $("#inputEmail3").next("span").text("");


        };
    });
    $("#save_employee").click(function (){
        if(!code_emp_empName){
            return false;
        }
       var empName=$("#empName").val();
       var zzempName=/^[\u2E80-\u9FFFa-z0-9_-]{2,16}$/;
       $("#empName").parent().removeClass("has-error has-success");
       if(!zzempName.test(empName)){
           // alert("用户名格式错误！");
           $("#empName").parent().addClass("has-error");
           $("#empName").next("span").text("用户名格式错误！");

           return false;
       }else {
           $("#empName").parent().addClass("has-success");
           $("#empName").next("span").text("");
       };
       /!*inputEmail3*!/
        var email=$("#inputEmail3").val();
        var zzemail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        $("#inputEmail3").parent().removeClass("has-error has-success");
        if(!zzemail.test(email)){
            $("#inputEmail3").parent().addClass("has-error");
            $("#inputEmail3").next("span").text("邮箱格式错误！");
            // alert("邮箱格式错误！");
            return false;
        }else {
            $("#inputEmail3").parent().addClass("has-success");
            $("#inputEmail3").next("span").text("");
        };
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data: $("#emp_from").serialize(),
            success:function (result){
                 // alert(result.msg);
                if (result.code==100)
                {
                    $('#addModel_emp').modal('hide');
                    to_page(totalpage);
                }
                else
                {
                    if(undefined != result.extend.errorFiled.empName)
                    {
                        $("#empName").parent().addClass("has-error");
                        $("#empName").next("span").text(result.extend.errorFiled.empName);
                    }
                    if(undefined != result.extend.errorFiled.email)
                    {
                        $("#inputEmail3").parent().addClass("has-error");
                        $("#inputEmail3").next("span").text(result.extend.errorFiled.email);
                    }
                }
            }
        });
    });
    $("#add_emp_button_model").click(function (){
        $("#emp_from")[0].reset();
        $("#inputEmail3").parent().removeClass("has-error has-success");
        $("#empName").parent().removeClass("has-error has-success");
        $("#inputEmail3").next("span").text("");
        $("#empName").next("span").text("");
        $("#department_select").empty();
          getDept("#department_select");
        $('#addModel_emp').modal({
            backdrop:"static"
        });

    });
    /*{"code":100,"smg":"处理成功！","extend":{"depts":[{"deptId":25,"deptName":"开发部"},{"deptId":26,"deptName":"测试部"}]}}*/
    function getDept(iddapt){

        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success(result){
                $.each(result.extend.depts,function (index,item){
                    $(iddapt).append($("<option></option>").append(item.deptName).attr("value",item.deptId));
                })
            }
        });
    }
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success(result){
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    }

    function build_emps_table(result){
        $("#emps_table tbody").empty();
        var emps=result.extend.PageInfo.list;
        $.each(emps,function (index,item){
            var empId=$("<td></td>").append(item.empId);
            var empName=$("<td></td>").append(item.empName);
            var gender=$("<td></td>").append(item.gender=="M"?"女":"男");
            var email=$("<td></td>").append(item.email);
            var deptName=$("<td></td>").append(item.department.deptName);
            /*<button class="btn btn btn-success btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑</button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除</button>*/
            var success=$("<button></button>").addClass("btn btn btn-success btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑")
                .attr("onclick","function_build_emp(this)");
            var danger=$("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var bianji=$("<td></td>")
                .append(success)
                .append(" ")
                .append(danger);
                  $("<tr></tr>")
                .append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(deptName)
                .append(bianji)
                .appendTo("#emps_table tbody");
        })
    }
    function build_page_info(result){
        $("#emp_page_info").empty();
        $("#emp_page_info").append("记录信息:  当前页码:"+
            result.extend.PageInfo.pageNum+",总页码:"+
            result.extend.PageInfo.pages+",总记录数:"+
            result.extend.PageInfo.total)
        totalpage=result.extend.PageInfo.total;
    }
    function build_page_nav(result){
        $("#Pagenavigationtwo").empty();
        var ulpage=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));

        var previousPage=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")).attr("href","#"));

        if(result.extend.PageInfo.hasPreviousPage==false)
        {
            firstPage.addClass("disabled");
            previousPage.addClass("disabled");

        }else {
            firstPage.click(function (){
                to_page(1);
            });
            previousPage.click(function (){
                to_page(result.extend.PageInfo.pageNum-1);
            });
        }
        var hasNextPage=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")).attr("href","#"));

        var endPage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if(result.extend.PageInfo.hasNextPage==false)
        {
            hasNextPage.addClass("disabled");
            endPage.addClass("disabled");

        }
        else
        {
            hasNextPage.click(function (){
                to_page(result.extend.PageInfo.pageNum+1);
            });
            endPage.click(function (){
                to_page(result.extend.PageInfo.pages);
            });
        }
        ulpage.append(firstPage).append(previousPage);
        $.each(result.extend.PageInfo.navigatepageNums,function (index,item){
            var listPage=$("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.PageInfo.pageNum==item)
            {
                listPage.addClass("active");
            }
            listPage.click(function (){
                to_page(item);
            })
            ulpage.append(listPage);
        })
        ulpage.append(hasNextPage).append(endPage);
        $("#Pagenavigationtwo").append(ulpage);

    }
    function  function_build_emp(event){
        /*edit_Model_emp*/
        $("#empName_edit").attr("value",$(event).parent().parent().find("td:first").next().text());
        $("#inputEmail3_edit").attr("value",$(event).parent().parent().find("td:first").next().next().next().text());
        $("#department_select_edit").empty();
        getDept("#department_select_edit");
        $('#edit_Model_emp').modal({
            backdrop:"static"
        });

        // alert($(event).parent().parent().find("td:first").next().text());
    }
</script>
</body>
</html>
<%--
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
  <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
  <link href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"  rel="stylesheet" >
  <script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Standard button -->
<button type="button" class="btn btn-default">（默认样式）Default</button>

<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
<button type="button" class="btn btn-primary">（首选项）Primary</button>

<!-- Indicates a successful or positive action -->
<button type="button" class="btn btn-success">（成功）Success</button>

<!-- Contextual button for informational alert messages -->
<button type="button" class="btn btn-info">（一般信息）Info</button>

<!-- Indicates caution should be taken with this action -->
<button type="button" class="btn btn-warning">（警告）Warning</button>

<!-- Indicates a dangerous or potentially negative action -->
<button type="button" class="btn btn-danger">（危险）Danger</button>

<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
<button type="button" class="btn btn-link">（链接）Link</button>
</body>
</html>--%>
