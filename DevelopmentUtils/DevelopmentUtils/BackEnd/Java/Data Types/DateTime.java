using System;
using System.Collections.Generic;
using System.Text;

namespace DevelopmentUtils.BackEnd.Java.Data_Types
{
    class DateTime
    {
		// const string DEFAULT_TIME_FORMAT = HH:mm:ss
		String MAX_TIME_VALUE = LocalTime.parse(LocalTime.MAX.toString(), DateTimeFormatter.ofPattern(DEFAULT_TIME_FORMAT)).toString()
    }
}