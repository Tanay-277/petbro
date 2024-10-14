package com.pet.pet; // Ensure this matches your project structure

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarUtil {
    public static String[][] getCalendar(int year, int month) {
        String[][] calendar = new String[6][7];
        Calendar cal = new GregorianCalendar(year, month, 1);

        // Calculate the first day of the month
        int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        int day = 1;
        for (int i = 0; i < 6; i++) { // 6 rows
            for (int j = 0; j < 7; j++) { // 7 columns
                if (i == 0 && j < firstDayOfWeek - 1) {
                    calendar[i][j] = "";
                } else if (day > daysInMonth) {
                    calendar[i][j] = "";
                } else {
                    calendar[i][j] = String.valueOf(day);
                    day++;
                }
            }
        }
        return calendar;
    }
}
