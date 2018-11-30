package collection.thread;

import java.util.Date;
import java.util.TimerTask;

public class Timerthread extends TimerTask {
    @Override
    public void run() {
        System.out.println("1:"+new Date());
        process();
        System.out.println("2"+new Date());
    }

    private void process() {
        try{
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
