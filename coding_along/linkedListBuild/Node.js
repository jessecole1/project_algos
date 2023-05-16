class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
    }
    addFront(val) {
        // Creating a new node object with the value (val) provided
        let new_node = new Node(val);

        // If the list is empty, place the new node as the head and return 
        if(!this.head) {
            this.head = new_node;
            return this;
        }

        // If the list is not empty, assign the head to be the next node to the new node 
        new_node.next = this.head;

        // Then finally assign the new_node to be the new head of the list 
        this.head = new_node;
        return this;
    }
}