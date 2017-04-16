package sample;

/**
 * Created by mohammedissa on 5/23/16.
 */
public class DNode {
  
   public int vertex;// The index of the vertex
   public int distance;// The distance between two vertices
   public DNode next =null;  // The pointer to the next node

    public DNode() {
    }
    public DNode(int vertex, int distance) {
        this.distance = distance;
        this.vertex = vertex;
    }
   
    
    public boolean isEmpty(){// This function check if the linkedlist has no element
        return (next == null)? true : false;
    }
    public void insertNode(int vertex, int distance){// Insert new node to the linkedlist
        DNode temp = new DNode(vertex,distance);// Create a new node with the given values
        temp.next = this.next;
        this.next = temp;// Add the new node to the list
    }
    public void printLinkedList(){// This function prints the DNode
        DNode node = this;// Assign node-variable to current node
        while(next != null){// While the linkedlist is not reach to the end
            node.toString();// Print the node
            node = node.next;// Move to the next Node
        }
    }
    @Override
    public String toString() {
        return "DNode{" + "distance=" + distance + ", vertex=" + vertex + '}';
    }
    
}
