package com.formacion.nttdata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.formacion.nttdata.crud.dao.EmployeeMapper;
import com.formacion.nttdata.crud.dto.Employee;
import com.formacion.nttdata.servicio.UserService;
import com.formacion.nttdata.servicio.ValidationFormService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	UserService userService;

	@Autowired
	ValidationFormService validationService;

	private static final String EMPLOYEE = "Employee";
	private static final String EMPLOYEELIST = "ListEmployees";
	private static final String ERRORPAGE = "ErrorPage";

	@RequestMapping("/listOfEmployee")
	public String showListOfEmployees(Model model) {
		model.addAttribute("employeeList", userService.getAllEmployees());
		return EMPLOYEELIST;
	}

	@RequestMapping("/showFormForAdd")
	public String addEmployee(Model model) {
		model.addAttribute("employee", new Employee());
		return EMPLOYEE;
	}

	@RequestMapping("/saveProcess")
	public String saveEmployee(@ModelAttribute("employee") Employee employee, Model model) {
		if (!validationService.validateEmployee(employee, model)) {
			model.addAttribute("error", "error");
			return EMPLOYEE;
		} else {
			userService.saveEmployee(employee);
			return "redirect:/employee/listOfEmployee";
		}

	}

	@RequestMapping("/displayUpdateForm")
	public String showUpdateForm(@RequestParam("employeeId") int employeeId, Model model) {
		model.addAttribute("employee", userService.getEmployeeById(employeeId));
		return EMPLOYEE;
	}

	@RequestMapping("/displayDeleteForm")
	public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
		userService.deteleEmployee(employeeId);
		return "redirect:/employee/listOfEmployee";
	}
}
