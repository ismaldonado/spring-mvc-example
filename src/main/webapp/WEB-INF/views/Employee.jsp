<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<%-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"
	integrity="sha512-Vp2UimVVK8kNOjXqqj/B0Fyo96SDPj9OCSm1vmYSrLYF3mwIOBXh/yRZDVKo8NemQn1GUjjK0vFJuCSCkYai/A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css"
	integrity="sha512-YDChav1pUAodyH1Ja7PIpEDUOoFROpZi5Lb7pY8+9+kU8UTr3J8SI8QO7SRuf4qdDKb5OI0xSt4Vk1wiYjBXgw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src=""> --%>
<body>
	<div class="container">
		<h1>Employee Details</h1>
		<hr />
		<s:form action="saveProcess" modelAttribute="employee" id="form">
			<s:hidden path="id" />
			<s:hidden path="" value="${employee.hobbies}" id="hobbies" />
			<div class="form-group">
				<s:input path="fullname" class="form-control"
					placeholder="Enter Full Name" id="fullname" />
				<p class="text-danger d-none" id="fullnameError">*Please provide
					a valid full name (E.g.: John Doe)</p>
			</div>
			<div class="form-group">
				<s:input path="email" placeholder="Enter Email" class="form-control"
					id="email" />
				<p class="text-danger d-none" id="emailError">*Please provide a
					valid email.</p>
			</div>
			<div class="form-group">
				<div class="form-check-inline">
					<label class="form-check-label"> <s:radiobutton
							path="gender" value="Male" class="form-check-input" id="male" />Male
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <s:radiobutton
							path="gender" value="Female" class="form-check-input" id="female" />Female
					</label>
				</div>
				<p class="text-danger d-none" id="genderError">*Please choose
					your gender.</p>
			</div>
			<div class="form-group">
				<div class="form-check-inline">
					<label class="form-check-label"> <s:checkbox path="hobbies"
							value="Sports" class="form-check-input" />Sports
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <s:checkbox path="hobbies"
							value="Browsing" class="form-check-input" />Browsing
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <s:checkbox path="hobbies"
							value="Running" class="form-check-input" />Running
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <s:checkbox path="hobbies"
							value="Chatting" class="form-check-input" />Chatting
					</label>
				</div>
			</div>
			<div class="form-group">
				<s:select path="country" class="form-control" id="country" required>
					<s:option value="0">--Select--</s:option>
					<s:option value="India">India</s:option>
					<s:option value="Australia">Australia</s:option>
					<s:option value="Japan">Japan</s:option>
					<s:option value="America">America</s:option>
					<s:option value="South Africa">South Africa</s:option>
					<s:option value="Sri Lanka">Sri Lanka</s:option>
				</s:select>
				<p class="text-danger d-none" id="countryError">*The country
					cannot be null.</p>
			</div>
			<div class="form-group">
				<s:textarea path="address" placeholder="Enter Address"
					class="form-control" id="address" />
				<p class="text-danger d-none" id="addressError">*The address
					cannot be null.</p>
			</div>
			<button type="submit" value="Save" class="btn btn-info" id="submit">Save</button>
				 &nbsp; 
			<button type="reset" value="Reset" class="btn btn-danger">Reset</button>
		</s:form>


		<c:if test="${not empty error}">
			<div class="text-danger">
				${fullnameError}
				${emailError}
				${genderError}
				${countryError}
				${addressError}
			</div>
		</c:if>
		<hr />
		<a href="listOfEmployee">Back to List</a>

	</div>
	<script
		src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var hobbies = $("#hobbies").val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(idx, element) {
				if (hobbies.indexOf(element.value) != -1) {
					element.setAttribute("checked", "checked");
					$("#hobbies").val("");
				} else {
					element.removeAttribute("checked");
				}
			});
		});

		$('#fullname').keyup(function() {
			validateFullname();
		});
		$('#fullname').blur(function() {
			validateFullname();
		});
		$('#email').keyup(function() {
			validateEmail();
		});
		$('#email').blur(function() {
			validateEmail();
		});
		$('#country').change(function() {
			validateCountry();
		});
		$('#country').blur(function() {
			validateCountry();
		});
		$('#address').keyup(function() {
			validateAddress();
		});
		$('#address').blur(function() {
			validateAddress();
		});

		//HAY QUE PONER LA FECHA DE MODIFICACION EN LA TABLA.
		//REDIRECCION CUANDO NO VALiDA BIEN EN CONTROLLER
		//REVISAR EL VALIDATIONSERVICE

		//EN QUE MOMENTO SE EJECUTA ESTO
		$('#submit').click(function(e) {
			if (!validateForm()) {
				e.preventDefault();
			}
		});

		function validateForm() {
			return validateFullname() && validateEmail() && validateGender()
					&& validateCountry() && validateAddress();
		}

		function validateFullname() {
			const fullname = $('#fullname').val();
			if ((fullname !== null && fullname.length < 3) || fullname == '') {
				$('#fullnameError').removeClass('d-none');
				$('#fullname').addClass('border border-danger');
				return false;
			}
			return fieldSuccess('#fullname');
		}

		function validateEmail() {
			const email = $('#email').val();
			if (!email.includes('@') || !email.includes('.') || email == '') {
				$('#emailError').removeClass('d-none');
				$('#email').addClass('border border-danger');
				return false;
			}
			return fieldSuccess('#email');
		}

		function validateGender() {
			const male = $('#male').is(':checked');
			const female = $('#female').is(':checked');
			if (male == false && female == false) {
				$('#genderError').removeClass('d-none');
				return false;
			}
			return fieldSuccess('#gender');
		}

		function validateCountry() {
			const country = $('#country').val();
			if (country === null || country === '0') {
				$('#countryError').removeClass('d-none');
				$('#country').addClass('border border-danger');
				return false;
			}
			return fieldSuccess('#country');
		}

		function validateAddress() {
			const address = $('#address').val();
			if (address.length < 5 || address == '') {
				$('#addressError').removeClass('d-none');
				$('#address').addClass('border border-danger');
				return false;
			}
			return fieldSuccess('#address');
		}

		function fieldSuccess(id) {
			$(id + 'Error').addClass('d-none');
			$(id).removeClass('border border-danger');
			return true;
		}
	</script>
</body>
</html>