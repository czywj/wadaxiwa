package task.one;

import java.util.*;

public class shuffle {
    public static void main(String[] args) {

        HashMap<Integer,String> poker = new HashMap<>();
        String[] color = {"♥","♠","♣","♦"};
        String[] number = {"2","A","k","Q","J","10","9","8","7","6","5","4","3"};
        int count = 0;
        ArrayList<Integer> index = new ArrayList<>();
        index.add(count);
        poker.put(count, "小王");
        count ++;
        index.add(count);
        poker.put(count, "大王");
        count ++;
        for(int i = 0 ; i < number.length ; i ++){
            for(int j = 0 ; j < color.length ; j ++){
                index.add(count);
                poker.put(count,color[j]+number[i]);
                count ++;
            }
        }
        Collections.shuffle(index);
        TreeSet<Integer> one = new TreeSet<>();
        TreeSet<Integer> two = new TreeSet<>();
        TreeSet<Integer> three = new TreeSet<>();
        TreeSet<Integer> dipai = new TreeSet<>();
        for(int n = 0 ; n < index.size() ; n ++){
            if(n >= index.size() - 3){
                dipai.add(index.get(n));
            }else if(n % 3 == 0){
                one.add(index.get(n));
            }else if(n % 3 == 1){
                two.add(index.get(n));
            }else if(n % 3 == 2){
                three.add(index.get(n));
            }
        }

        Print("one",one,poker);
        Print("two",two,poker);
        Print("three",three,poker);
        Print("dipai",dipai,poker);

        
    }

    private static void Print(String name, TreeSet<Integer> t, HashMap<Integer, String> poker) {

        System.out.println(name + "的牌是:");
        for(Integer x :t){
            System.out.print(poker.get(x) + " ");
        }
        System.out.println();
    }
}
