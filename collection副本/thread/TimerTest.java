package collection.thread;

import java.util.Timer;
import java.util.TimerTask;

public class TimerTest {
    public static void main(String[] args) throws InterruptedException {
        TimerTask timerTask = new Timerthread();
        Timer timer = new Timer(true);
        timer.scheduleAtFixedRate(timerTask,0,7*1000);
        System.out.println("TimerTask started");

        Thread.sleep(10000);
    }
}
