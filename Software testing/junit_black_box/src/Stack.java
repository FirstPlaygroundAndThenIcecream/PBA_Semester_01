/**
 * Modified by Tom Stevns on October 23, 2018
 */
public interface Stack {

    /**
     * post: Returns true if stack is empty, false otherwise
     */
    public boolean isEmpty();

    /**
     * Removes all items from the stack
     * post: isEmpty() == true
     */
    public void makeEmpty();

    /**
     * post: item is at top of stack
     *
     * @param item the item to be inserted on top of stack
     */
    public void push(Object item);

    /**
     * post: item at top of stack has been removed and has been returned
     * null was returned if nothing was on the stack
     */
    public Object pop();

    /**
     * post: item at top of stack has been returned
     * null was returned if nothing was on the stack
     */
    public Object top();

    /**
     * post: number of items on stack has been returned
     */
    public int size();

    /**
     * Return a String representing this Stack. The String is a comma separated
     * list (no spaces) of the String representation of each element in the
     * Stack, begining from the bottom, enclosed in square brackets. For
     * instance, a Stack containing Integers 1, 2 and 3 is represented as
     * "[1,2,3]".
     *
     * @return String representation of this Stack.
     */
    public String toString();
}
