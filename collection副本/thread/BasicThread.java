package collection.thread;

public class BasicThread extends Thread {

    public BasicThread(String name) {
        super(name);
    }

    @Override
    public void run() {
        System.out.println("RUNNABLE START" + Thread.currentThread().getName());
        try {
            Thread.sleep(1000);
            processing();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("RUNNABLE END" + Thread.currentThread().getName());

    }
    private void processing() throws InterruptedException {
        System.out.println("processing");
        Thread.sleep(5000);
    }


}
