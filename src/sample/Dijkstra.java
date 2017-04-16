package sample;


/**
 * Created by mohammedissa on 5/23/16.
 */



/* This is a Dijkstra class that Implements
*  the Dijkstra Algorithms thats find the min 
*  path between vertices in a graph
*/
public class Dijkstra {
    Vertex header;// Store the index of the vertex
    boolean  known;// Flag to state that the vertex is visited or not
    int distance;// The distance betweent the start vertex and the vertex header
    Vertex path;// The previous vertex of the vertex header

    public Dijkstra() {
    }
    public Dijkstra(Vertex header, boolean  known, int distance, Vertex path) {
        this.header = header;
        this.known = known;
        this.distance = distance;
        this.path = path;
    }
    
}
