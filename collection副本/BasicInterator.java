package collection;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class BasicInterator {

    public static void main(String[] args) {
        List<String> list = new LinkedList<>();
        list.add("wadaxiwa");
        list.add("youxi");
        list.add("soudousilei");

        Iterator<String> listIterator = list.iterator();

        while(listIterator.hasNext()){
            System.out.println(listIterator.next());
        }
    }

}
