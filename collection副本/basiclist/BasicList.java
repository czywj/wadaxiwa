package collection.basiclist;

import java.util.ArrayList;
import java.util.List;

public class BasicList {

    public static void main(String[] args) {
        List<String> v = new ArrayList<>();

        v.add("e");
        v.add("i");
        v.add(0,"a");
        System.out.println(v);

        List<String> addon = new ArrayList<>();
        addon.add("o");
        addon.add("u");
        v.addAll(addon);
        System.out.println(v);

        addon.clear();
        System.out.println(v.size());

        v.clear();
        System.out.println(v.size());

        v.add("e");
        v.add("e");
        v.add("i");
        v.add("o");
        addon = v.subList(0,2);
        System.out.println("v:"+v+"  addon:"+addon);

        v.set(0,"a");
        System.out.println(v);
        v.add(0,"a");
        System.out.println(v);


    }

}
