package com.atguigu.crud.test;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @program: CrudTwo
 * @description:
 * @author: Mr.Tan
 * @create: 2022-09-22 21:12
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();

    }
    @Test
    public void testPage() throws Exception {
        MvcResult pn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "20")).andReturn();
        MockHttpServletRequest request = pn.getRequest();
       PageInfo  pageInfo = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页码"+pageInfo.getPageNum());
        System.out.println("总页码"+pageInfo.getPages());
        System.out.println("总 记录数"+pageInfo.getTotal());
        System.out.println("hello!");
        System.out.println("连续显示页码");
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for(int i: navigatepageNums){
            System.out.println("   "+i);
        }
        System.out.println("..................");
        List<Employee> list = pageInfo.getList();
        list.forEach(employee -> System.out.println(list));

    }
    @Test public void ce(){
       /* List<Employee> list= employeeService.getAll();
        list.forEach(employee -> System.out.println(employee));*/
        System.out.println(false?1:2);

    }
}
