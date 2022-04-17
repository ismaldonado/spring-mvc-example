package com.formacion.nttdata.servicio;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.formacion.nttdata.crud.dto.Employee;


@Service
public class ValidationFormService {

	
	public boolean validateEmployee(Employee employee, Model model) {
		return this.validateFullname(employee, model) && this.validateEmail(employee, model) && this.validateGender(employee, model)
				&& this.validateCountry(employee, model) && this.validateAdress(employee, model)
						? true
						: false;
	}

	private boolean validateFullname(Employee employee, Model model) {
		if (employee.getFullname() == null || employee.getFullname().isEmpty()
				|| !employee.getFullname().matches("^[A-Za-z\\s]{3,}[\\.]{0,1}[A-Za-z\\s]{3,}+$")) {
			model.addAttribute("fullnameError", "Please, enter a valid fullname. Name and surname");
			return false;
		}
		return true;
	}

	private boolean validateEmail(Employee employee, Model model) {
		if (employee.getEmail() == null || employee.getEmail().isEmpty()
				|| !employee.getEmail().matches("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")) {
			model.addAttribute("emailError", "Please, enter a valid email. test@email.com");
			return false;
		}
		return true;
	}

	private boolean validateGender(Employee employee, Model model) {
		if (employee.getGender() == null) {
			model.addAttribute("genderError", "Please, enter a valid gender.");
			return false;
		}
		return true;
	}

	private boolean validateCountry(Employee employee, Model model) {
		if (employee.getCountry() == null || employee.getCountry() == "0") {
			return false;
		}
		return true;
	}

	private boolean validateAdress(Employee employee, Model model) {
		if (employee.getAddress() == null) {
			return false;
		}
		return true;
	}

}
