/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.javaModel;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Firsty
 * https://stackoverflow.com/questions/3859288/how-to-calculate-time-ago-in-java
 */
public class TimeAgo {

    public TimeAgo() {
    }

    public final List<Long> times = Arrays.asList(
            TimeUnit.DAYS.toMillis(365),
            TimeUnit.DAYS.toMillis(30),
            TimeUnit.DAYS.toMillis(1),
            TimeUnit.HOURS.toMillis(1),
            TimeUnit.MINUTES.toMillis(1),
            TimeUnit.SECONDS.toMillis(1));
    public final List<String> timesString = Arrays.asList("year", "month", "day", "hour", "minute", "a moment");

    private String toDuration(long duration) {

        StringBuffer res = new StringBuffer();
        for (int i = 0; i < this.times.size(); i++) {
            Long current = this.times.get(i);
            long temp = duration / current;
            if (temp > 0) {
                res.append(temp).append(" ").append(this.timesString.get(i)).append(temp != 1 ? "s" : "").append(" ago");
                break;
            }
        }
        if ("".equals(res.toString())) {
            return "a moment ago";
        } else {
            return res.toString();
        }

    }
    
    public String compareToDuration(Date date1, Date date2) {
        return this.toDuration(Math.abs(date1.getTime() - date2.getTime()));
    }
}
