package com.formacion.nttdata.servicio;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.formacion.nttdata.crud.dao.EmployeeMapper;
import com.formacion.nttdata.crud.dto.Employee;

@Service
public class UserService {

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	ValidationFormService validationService;

	public void saveEmployee(Employee employee) {
		if (employee.getId() == null) {
			employeeMapper.saveEmployee(employee);
		} else {

			employee.setUpdateDate(dateFormat());
			employeeMapper.updateEmployee(employee);
		}

	}

	public Employee getEmployeeById(int employeeId) {
		return employeeMapper.findById(employeeId);
	}

	public void deteleEmployee(int employeeId) {
		employeeMapper.deleteEmployee(employeeId);
	}

	public List<Employee> getAllEmployees() {
		return employeeMapper.getAllEmployees();
	}

	private String dateFormat() {
		Date date = new Date();
		String fd = new String(date.getDate() + "/" + date.getMonth() + "/" + date.getYear());

		return fd;
	}

}
