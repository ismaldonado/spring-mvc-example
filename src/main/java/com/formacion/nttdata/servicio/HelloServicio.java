package com.formacion.nttdata.servicio;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class HelloServicio {
	
	public void showInfo(String userName, int days, Locale locale, Model model) {
		model.addAttribute("userName", userName);
		this.showFutureDate(days, locale, model);
	}

	private void showFutureDate(int days, Locale locale, Model model) {

		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, days);
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(calendar.getTime());
		model.addAttribute("serverTime", formattedDate);

	}

}
