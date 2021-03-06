package collection.thread.threadpool;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class BasicExcutorService {


    public static void main(String[] args) {
        final int threadNum = 3;
        final int loopNum = 3;
        final int taskNum = 5;
        ExecutorService executorService = Executors.newFixedThreadPool(threadNum);
        for(int i = 1; i <= taskNum; i++){
            BasicTask task = new BasicTask(i,loopNum);
            executorService.submit(task);
        }
        executorService.shutdown();
    }
}

class BasicTask implements Runnable{

    private int taskId;
    private int loopNum;

    public BasicTask(int taskId, int loopNum) {
        this.taskId = taskId;
        this.loopNum = loopNum;
    }

    @Override
    public void run() {
        for(int i = 1; i <= loopNum; i++){
            System.out.println("task #" + this.taskId + " - Iteration # " + i);
            try{
                Thread.sleep(1000);

            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
