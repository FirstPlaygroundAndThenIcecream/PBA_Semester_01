import java.util.LinkedList;

public class OurStack<T> implements Stack {

    private LinkedList<T> list;

    public OurStack()
    {
        list = new LinkedList<T>();


    }

    @Override
    public boolean isEmpty() {
        return list.isEmpty();
    }

    @Override
    public void makeEmpty() {
        list.clear();
    }

    @Override
    public void push(Object item) {

        T lol;

        try{
            lol = (T) item;
        } catch (Exception e){
            throw new IllegalArgumentException();
        }

        list.addFirst(lol);
    }

    @Override
    public Object pop() {
        if (isEmpty()) return null;
        return list.pop();
    }

    @Override
    public Object top() {
        return list.peek();
    }

    @Override
    public int size() {
        return list.size();
    }

    public String toString() {

        if(list.isEmpty()) return  "[]";

        String formattedList = "[";
        for (T t: list) {
            formattedList += t + ",";

        }
        String theRealDeal = formattedList.substring(0, formattedList.length()-1);
        theRealDeal += "]";
        return theRealDeal;
    }

}









