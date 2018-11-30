package collection.thread.threadpool;

import java.time.LocalDateTime;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class BasicScheduleExecutorService {

    public static void main(String[] args) {
        final int threadpool = 3;
        ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(threadpool);

        ScheduleTask t1 = new ScheduleTask(1);
        ScheduleTask t2 = new ScheduleTask(2);

        scheduledExecutorService.schedule(t1,2, TimeUnit.SECONDS);
        scheduledExecutorService.scheduleAtFixedRate(t2,0,10,TimeUnit.SECONDS);

        try{
            TimeUnit.SECONDS.sleep(25);
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        scheduledExecutorService.shutdown();


    }

}

class ScheduleTask implements Runnable{
    private  int taskId;
    public ScheduleTask(int taskId){
        this.taskId = taskId;
    }
    @Override
    public void run(){
        LocalDateTime currennt = LocalDateTime.now();
        System.out.println("task #" + this.taskId + " run at" + currennt);
    }
}


