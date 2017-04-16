package sample;

/**
 * Created by mohammedissa on 5/23/16.
 */
public class Vertex implements Cloneable{
    public int id;
    public String name;
    public int x1;// The lower x_coordinate 
    public int y1;// The lower y_coordinate
    public int x2;// The upper x_coordinate
    public int y2;// The upper y_coordinate
    public int x_center;// The x_coordinate to draw the star
    public int y_center;// The y_coordinate to draw the star
    public String description;// Inforamtion about the vertex
    public String imagePath;//Image Path for the vertex
    public String url;
    DNode neighbors = new DNode();// Linked-List to store the neighbors of the vertex

    public Vertex(int id, String name, int s, int s1, int s2, int s3, int s4, int s5, String description, String imagePath, String url) {

    this.id =id;this.name=name;this.x1=s;this.y1=s1;this.x2=s2;this.y2=s3;this.x_center=s4;this.y_center=s5;this.description=description;this.imagePath=imagePath;this.url=url;

    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setX1(int x1) {
        this.x1 = x1;
    }

    public void setY1(int y1) {
        this.y1 = y1;
    }

    public void setX2(int x2) {
        this.x2 = x2;
    }

    public void setY2(int y2) {
        this.y2 = y2;
    }

    public void setX_center(int x_center) {
        this.x_center = x_center;
    }

    public void setY_center(int y_center) {
        this.y_center = y_center;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setNeighbors(DNode neighbors) {
        this.neighbors = neighbors;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getX1() {
        return x1;
    }

    public int getY1() {
        return y1;
    }

    public int getX2() {
        return x2;
    }

    public int getY2() {
        return y2;
    }

    public int getX_center() {
        return x_center;
    }

    public int getY_center() {
        return y_center;
    }

    public String getDescription() {
        return description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public DNode getNeighbors() {
        return neighbors;
    }


    
    public Vertex() {
        neighbors = new DNode();
    }
    public Vertex(String id, String name) {
        this();
        this.id = Integer.parseInt(id);
        this.name = name;
    }



    public Vertex(String name, String x1, String y1, String x2, String y2, String x_center, String y_center) {
        this();
        this.name = name;
        this.x1 =  Integer.parseInt(x1);
        this.y1 =  Integer.parseInt(y1);
        this.x2 =  Integer.parseInt(x2);
        this.y2 =  Integer.parseInt(y2);
        this.x_center =  Integer.parseInt(x_center);
        this.y_center =  Integer.parseInt(y_center);
    }
    public Vertex( String name, String x1, String y1, String x2, String y2, String x_center, String y_center, String des,String imagePath) {
        this.name = name;
        this.x1 =  Integer.parseInt(x1+"");
        this.y1 =  Integer.parseInt(y1+"");
        this.x2 =  Integer.parseInt(x2+"");
        this.y2 =  Integer.parseInt(y2+"");
        this.x_center =  Integer.parseInt(x_center+"");
        this.y_center =  Integer.parseInt(y_center+"");
        this.description = des;
        this.imagePath=imagePath;
    }
    public Vertex( String id ,String name, String x1, String y1, String x2, String y2, String x_center, String y_center, String des,String imagePath) {
        this.name = name;
        this.id = Integer.parseInt(id+"");
        this.x1 =  Integer.parseInt(x1+"");
        this.y1 =  Integer.parseInt(y1+"");
        this.x2 =  Integer.parseInt(x2+"");
        this.y2 =  Integer.parseInt(y2+"");
        this.x_center =  Integer.parseInt(x_center+"");
        this.y_center =  Integer.parseInt(y_center+"");
        this.description = des;
        this.imagePath=imagePath;
    }
   
    
    public void addNeighbor(int vertex, int distance){
      neighbors.insertNode(vertex, distance);
    }

    @Override
    public String toString() {
        return "Vertex{" + "id=" + id + ", name=" + name + ", x1=" + x1 + ", y1=" + y1 + ", x2=" + x2 + ", y2=" + y2 + ", x_center=" + x_center + ", y_center=" + y_center + ", description=" + description + ", neighbors=" + neighbors + '}';
    }
   
    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone(); //To change body of generated methods, choose Tools | Templates.
    }
    
   
    
    
}
