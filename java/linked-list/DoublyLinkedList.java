import java.util.Collection;
import java.util.List;

public class DoublyLinkedList<T> {
    static class Node<U> {
        private Node<U> previous;
        private Node<U> next;

        public U data;
        public Node(U data) {
            this.data = data;
            previous = next = null;
        }

        // attach after this node, return said newly created
        // and attached node
        public Node<U> attachAfter(U data) {
            Node<U> saved = next;
            next = new Node<>(data);
            next.previous = this;
            next.next = saved;
            return next;
        }

        /* ... <-> this <-> candidate <-> ... */
        public void linkAfter(Node<U> candidate) {
            if (candidate.previous != null) {

            }
            else {
                next = candidate;
                candidate.previous = this;
            }
        }

        /* ... <-> candidate <-> this <-> ... */
        public void linkBefore(Node<U> candidate) {
            if (candidate.next != null) {
                throw new IllegalStateException("whateve");
            }
            else {
                candidate.next = this;
                previous = candidate;
            }

        }

        // attach before this node, return said newly
        // created and attached node
        public Node<U> attachBefore(U data) {
            Node<U> saved = previous;
            previous = new Node<>(data);
            previous.next = this;
            previous.previous = saved;
            return previous;
        }

        public boolean isTerminal() {
            return previous == null || next == null;
        }

        public U discardBefore() {
            Node<U> toBeRemoved = previous;
            previous = toBeRemoved.previous;
            previous.next = this;
            toBeRemoved.previous = toBeRemoved.next = null;
            return toBeRemoved.data;
        }

        public U discardAfter() {
            Node<U> toBeRemoved = next;
            next = toBeRemoved.next;
            next.previous = this;
            toBeRemoved.previous = toBeRemoved.next = null;
            return toBeRemoved.data;
        }

        // remove self from the chain
        public U discardSelf() {
            previous.next = next;
            next.previous = previous;
            previous = next = null;
            return data;
            // now wait for the garbage collector
        }

        Node<U> pred() {
            return previous;
        }
        Node<U> succ() {
            return next;
        }
    }


    private Node<T> head;
    private Node<T> tail;

    public DoublyLinkedList() {
        head = tail = null;
    }

    public DoublyLinkedList(T elem) {
        head = new Node<>(elem);
        tail = head;
    }

    public void push(T element) {
        if (tail == null) {
            assert head == null;
            tail = new Node<>(element);
        }
        else {
            tail = tail.attachAfter(element);
        }
    }

    public void unshift(T element) {
        head = head.attachBefore(element);
    }

    public T pop() {
        T value = tail.data;
        tail.pred().discardAfter();
        //head.discardBefore(); // the thing before the head is the tail. circular

        return value;
    }
    public T shift() {
        T value = head.data;
        head.succ().discardBefore();
        //tail.discardAfter();

        return value;
    }
}
