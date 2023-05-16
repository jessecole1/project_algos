class Node {
    constructor(data){
        this.data = data;
        this.next = null;
    }
}

node1 = new Node(10);
// console.log(node1.data);

class SinglyLinkedList {
    constructor(head = null) {
        this.head = head;
    }

    push(data) {
        if (this.head === null){
            this.head = new Node(data);
            return;
        }
        let pointer = this.head;
        while( pointer.next !== null){
            pointer = pointer.next;
        }
        pointer.next = new Node(data);
    }

    pop() {
        if (this.head === null){
            return null;
        }
        let pointer = this.head;
        if (pointer.next === null){
            this.head = null;
            return pointer.data;
        }
        while (pointer.next.next !== null){
            pointer = pointer.next;
        }
        const temp = pointer.next.data;
        pointer.next = null;
        return temp;

    }
}