package collection.thread;

public class DaemonThtead implements Runnable {
    @Override
    public void run() {
        while(true){
            processing();
        }
    }

    private void processing() {
        System.out.println("p d t");
        try{
            Thread.sleep(1000);
        }

         catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
