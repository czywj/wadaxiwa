package collection.basiclist;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

public class LoopList {

    public static void main(String[] args) {

        List<String> s = new ArrayList<>();
        s.add("google");
        s.add("microsoft");
        s.add("facebook");
        s.add("sinna");
        s.add("apple");

        Consumer<Object> consumer = new LoopList().new MyConsumer();
        s.forEach(consumer);

    }

     class MyConsumer implements Consumer<Object>{
         @Override
         public void accept(Object o) {
             System.out.println(o);
         }
     }

}
