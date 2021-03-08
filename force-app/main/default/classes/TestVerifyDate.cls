@isTest
private class TestVerifyDate {
    @isTest static void TestDateWithin30Days() { // Passed
        Date date1 = Date.today();
        Date date2 = Date.today().addDays(1);

        Date dateOK = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(dateOK, date2);
    }
    
    @isTest static void TestSetEndOfMonthDatePass() { // Passed, pero...
        Date date1 = Date.today().addDays(1);
        Date date2 = Date.today();

        Date dateOK = VerifyDate.CheckDates(date1, date2);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        System.assertEquals(dateOK, date1.addDays(totalDays - date1.day()));
    }

    @isTest static void TestSetEndOfMonthDateFail() { // Fail
        Date date1 = Date.today().addDays(1);
        Date date2 = Date.today();

        Date dateOK = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(dateOK, date1);
    }
}