package com.atguigu.crud.controller;
import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.DepartmentServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
/**
 * @program: CrudTwo
 * @description:
 * @author: Mr.Tan
 * @create: 2022-09-24 10:26
 **/
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentServer departmentServer;
    @ResponseBody
    @RequestMapping("/depts")
    public Msg deptController(){
        List<Department> depts = departmentServer.getDepts();
        return Msg.success().add("depts",depts);
    }


}
