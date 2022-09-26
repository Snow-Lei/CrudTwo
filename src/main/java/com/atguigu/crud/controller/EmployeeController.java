package com.atguigu.crud.controller;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.swing.plaf.basic.BasicSplitPaneUI;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: CrudTwo
 * @description:
 * @author: Mr.Tan
 * @create: 2022-09-22 20:28
 **/
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @ResponseBody
    @RequestMapping("/emps")
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> list= employeeService.getAll();
        //封装页码，以及传入的页数
        PageInfo pageInfo = new PageInfo(list,5);
        return
        Msg.success().add("PageInfo",pageInfo);
    }
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //分页查询
        // 传入页码，以及页面大小
        PageHelper.startPage(pn,5);
        List<Employee> list= employeeService.getAll();
        //封装页码，以及传入的页数
        PageInfo pageInfo = new PageInfo(list,5);
        model.addAttribute("pageInfo",pageInfo);
        System.out.println("到达’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’‘");
        return "list";
    }
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors())
        {
            Map<String,Object> map=new HashMap<String,Object>();

            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError errors:fieldErrors)
            {
                System.out.println("错误字段名:"+errors.getField());
                System.out.println("错误信息:"+errors.getDefaultMessage());
                map.put(errors.getField(),errors.getDefaultMessage());
            }

            return Msg.fail().add("errorFiled",map);
        }
        else
        {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("empName")String empName){
       boolean checkUser= employeeService.checkUser(empName);
       return checkUser?Msg.success():Msg.fail();
    }
}
