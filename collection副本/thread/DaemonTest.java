package collection.thread;

public class DaemonTest {

    public static void main(String[] args) throws InterruptedException {
        Thread dt = new Thread(new DaemonThtead(),"dt");
        dt.setDaemon(true);
        dt.start();

        Thread.sleep(5000);
        System.out.println("finish");
    }

}
