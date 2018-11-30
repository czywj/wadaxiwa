package collection.hashmap;

import java.util.HashMap;
import java.util.Map;

public class ComputMap {

    public static void main(String[] args) {
        Map<String,String> map = new HashMap<>();
        map.put("1","111");
        map.put("2","222");
        map.put("3","333");
        map.put("null","555");
        map.put("555","null");

        System.out.println(map);
        for(String key : map.keySet()){
            map.compute(key,(k,v) -> k + v);
        }
        System.out.println(map);

    }

}
