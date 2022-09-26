package com.atguigu.crud.test;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

/**
 * @program: CrudTwo
 * @description:
 * @author: Mr.Tan
 * @create: 2022-09-22 17:52
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})


public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession session;

    @Test
    public void test(){
//        System.out.println(departmentMapper);
        /*departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/
//        employeeMapper.insertSelective(new Employee(null,"张三","M","163.com",25));
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);

        for(int i=0;i<1000;i++){
            String substring = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null,substring,"F",substring+"@163.com",26));
            System.out.println(i);
        }
        System.out.println("批量完成");
    }

}
