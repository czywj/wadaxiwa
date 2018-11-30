package collection;

public class TripleSange <T extends Number & Comparable<T>>{

    private T value1;
    private T value2;
    private T value3;

    public TripleSange(T value1, T value2, T value3) {
        this.value1 = value1;
        this.value2 = value2;
        this.value3 = value3;
    }

    public void setValue1(T value1) {
        this.value1 = value1;
    }

    public T getValue1() {
        return value1;
    }

    private T addValue() {
        Number result = value1.doubleValue() + value2.doubleValue() + value3.doubleValue();
        return (T)result;
    }

    private T largest() {
        T result = value1;
        if(value2.compareTo(result) == 1) {
            result = value2;
        }
        if(value3.compareTo(result) == 1) {
            result = value3;
        }
        return result;
    }

    public static void main(String[] args) {

        TripleSange<Float> t = new TripleSange<>(1000.8f,389.2f,666.6f);
        System.out.println(t.getValue1());
        System.out.println(t.addValue());
        System.out.println(t.largest());

    }

}
