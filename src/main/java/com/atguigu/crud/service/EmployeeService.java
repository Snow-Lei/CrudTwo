package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @program: CrudTwo
 * @description:
 * @author: Mr.Tan
 * @create: 2022-09-22 20:44
 **/
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {

      return   employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);

    }

    public boolean checkUser(String empName)  {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        int i = employeeMapper.countByExample(employeeExample);
        return i==0;
    }
}
