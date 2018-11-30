package collection.hashmap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SimpleDict {

    public static void main(String[] args) {
        Map<String,List<String>> d = new HashMap<>();
        List<String> lista = new ArrayList<>();
        lista.add("adon");
        lista.add("apple");
        lista.add("age");
        lista.add("abandon");

        List<String> listb = new ArrayList<>();
        listb.add("banana");
        listb.add("banlna");
        listb.add("banana");
        listb.add("banana");
        d.put("a",lista);
        d.put("b",listb);

        for(Map.Entry<String,List<String>> en : d.entrySet()){
            System.out.println(en.getKey());
            System.out.println(en.getValue());
        }

    }

}
