package collection;

public class Jicheng {

    public static class MyClass<E> {
    }

    public static void main(String[] args) {
        String str = "youxi";
        Object obj = str;
        System.out.println(obj);

        MyClass<String> myClass = new MyClass<>();
        obj = myClass;
        System.out.println(obj);

        MyClass<String> myClass1 = new MyClass<>();
        MyClass<Object> myClass2 = new MyClass<>();
        obj = myClass1;
        System.out.println(obj);
    }
}
