package collection.thread;

public class ThreadTest {
    public static void main(String[] args) {

        Thread t = new Thread(new ThreadDemo(),"t1");
        Thread d = new Thread(new ThreadDemo(),"t2");
        System.out.println("Starting......");
        t.start();
        d.start();
        System.out.println("Started");

        Thread t1 = new BasicThread("t3");
        Thread d2 = new BasicThread("t4");
        System.out.println("Starting......");
        t1.start();
        d2.start();
        System.out.println("Started");

    }
}
