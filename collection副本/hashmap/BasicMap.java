package collection.hashmap;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class BasicMap {

    public static void main(String[] args) {

        Map<String,String> d = new HashMap<>();
        d.put("a","a");
        d.put("b","b");
        d.put(null,null);
        System.out.println(d);

        System.out.println(d.get(null));

        System.out.println(d.get("a"));
        System.out.println(d.getOrDefault("e","zhao bu dao"));

        Set<Map.Entry<String, String>> entryData = d.entrySet();
        entryData.forEach(System.out::println);

        System.out.println(d.keySet());


    }

}
