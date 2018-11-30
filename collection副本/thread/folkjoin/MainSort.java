package collection.thread.folkjoin;

import java.util.Random;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveAction;

class QuickSort{
    public static int partition(Long[] number,int low,int hight){

        Long soldier = number[low];
        while(low < hight){
            while(low < hight) {
                if(number[hight] < soldier){
                    number[low] = number[hight];
                    break;
                }
                hight --;
            }
            while(low < hight){
                if(number[low] > soldier){
                    number[hight] = number[low];
                    break;
                }
                low ++;
            }
        }

        number[low] = soldier;
        return low;

    }

    public static void qsort(Long[] number, int low,int high){
        if(low < high){
            int soldier = partition(number,low,high);
            qsort(number,low,soldier-1);
            qsort(number,soldier + 1,high);
        }
    }
}

public class MainSort {

    private static Long[] genhiopj(int n){
        Random random = new Random();
        Long[] num = new Long[n];

        for(int i =0 ;i<n;i++){
            Long number = random.nextLong();
            if(number < 0){
                number = Math.abs(number);
            }
            num[i] = number;
        }
        return num;
    }

    public static void main(String[] args) {
        final int RUN_TIME = 10;
        final int Sort = 100000000;
        final int THRESHOLD = 36200;

        Long startTime;
        for(int i=0;i<RUN_TIME +1; i++){
            System.out.println("The " + i + " run:");
            System.out.println("Ge " + Sort + " numbers");

            Long[] qsNumber = genhiopj(Sort);
            System.out.println("Execueting QuickSort");
            startTime = System.currentTimeMillis();
            QuickSort.qsort(qsNumber,0,qsNumber.length-1);
            Long qsRunTime = System.currentTimeMillis() - startTime;
            System.out.println("Total user: " + qsRunTime + " ms");

            Long[] pqsNumber = genhiopj(Sort);
            System.out.println("Executing Parallel QuickSort");
            ForkJoinPool pool = new ForkJoinPool();
            ParallelQuickSort parallelQuickSort = new ParallelQuickSort(THRESHOLD,pqsNumber);
            startTime = System.currentTimeMillis();
            pool.execute(parallelQuickSort);
            while(!parallelQuickSort.isDone()){

            }
            Long pqsRunTime = System.currentTimeMillis() - startTime;
            System.out.println("Total user: " + pqsRunTime + "ms");
        }
    }
}

class ParallelQuickSort extends RecursiveAction {

    private int threahold = 30;
    private int low;
    private int high;
    private Long[] numbers;

    ParallelQuickSort(int threahold, Long[] numbers) {
        this.threahold = threahold;
        this.numbers = numbers;
        this.high = numbers.length-1;
        this.low = 0;
    }

    private ParallelQuickSort(int low,int high,Long[] numbers){
        this.low = low;
        this.high = high;
        this.numbers = numbers;
    }

    public static int partition(Long[] number,int low,int hight){

        Long soldier = number[low];
        while(low < hight){
            while(low < hight) {
                if(number[hight] < soldier){
                    number[low] = number[hight];
                    break;
                }
                hight --;
            }
            while(low < hight){
                if(number[low] > soldier){
                    number[hight] = number[low];
                    break;
                }
                low ++;
            }
        }

        number[low] = soldier;
        return low;

    }

    @Override
    protected void compute() {
        if(high - low < threahold){
            QuickSort.qsort(numbers,low,high);
        }else{
            int soldier = partition(numbers,low,high);
            ParallelQuickSort left = new ParallelQuickSort(low,soldier-1,numbers);
            ParallelQuickSort right = new ParallelQuickSort(soldier+1,high,numbers);
            invokeAll(left,right);
        }
    }
}
