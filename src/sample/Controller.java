package sample;

import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.text.Font;

import javax.imageio.ImageIO;
import java.awt.Desktop;
import java.io.UnsupportedEncodingException;
import java.net.URI;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.*;
import java.util.ArrayList;



public class Controller {

    public static Integer current = 0;

    public  Vertex[] vertices;// The array of vertices
    public  int tracker = 0;// Tracker to track the number of vertices
    Dijkstra[] table;// Dijkstra table to get the min-distance path from vertex to another
    public String[] edges;

    public boolean firstrun = true;

    public  int counter = 0;


    @FXML
    private TextArea pathField;
    @FXML
    private Label distanceField;
    @FXML
    private ComboBox<String> toCombo;
    @FXML
    private ComboBox<String> fromCombo;
    @FXML
    private Button shortest;
    @FXML
    private TextArea textArea;
    @FXML
    private ImageView imageView2;
    @FXML
    private ImageView imageView;
    @FXML
    private TextField textField;

    @FXML
    private Canvas drawArea;
    private GraphicsContext gc;
    private ComboBox<String> FromComboBox;
    private ComboBox<String> ToComboBox;
    private ComboBox<String> updateFrom;
    private ComboBox<String> updateTo;


    @FXML
    private void print(){

        drawArea.setOnMouseClicked(e -> {

            if(firstrun){

                ReadVertices();
                BuildGraph();

                firstrun = false;

            }


            int x = (int) e.getX(), y = (int) e.getY();

            gc = drawArea.getGraphicsContext2D();


            Image stars = new Image("sample/star.png");


            for (int i = 0; i < tracker; i++) {

                if(x >= vertices[i].x1 && x <= vertices[i].x2 && y >= vertices[i].y1 && y <= vertices[i].y2)// Check if the point is known vertex or not
                {
                    textArea.setText("");
                    current = i;


                    BufferedImage bufferedImage = null;
                    try {
                        bufferedImage = ImageIO.read(new File(vertices[i].getImagePath()));
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                    Image image = SwingFXUtils.toFXImage(bufferedImage, null);
                    imageView2.setImage(image);
                    String res = vertices[i].getDescription();
                    System.out.print(res);
                    textArea.setText(res);

//                    info.setText(vertices[i].description);//Print the information about the selected vertex

                    if(counter >= 2){
                        gc.clearRect(0,0,400,741);
                        counter=0;
                    }

                    if(counter == 0){// If the From vertex is Selected do NOT change it
                        fromCombo.getSelectionModel().select(vertices[i].name);
                        gc.drawImage(stars, x - 10, y - 10);
                        counter++;
                    }
                    else if(counter ==1){
                        toCombo.getSelectionModel().select(vertices[i].name);
                        gc.drawImage(stars, x - 10, y - 10);
                        counter ++;


                    }// Change the To vertex while the from vertex is selected
                    break;
                }

            }

        });


    }

    @FXML
    private void calculateButton(ActionEvent evt) throws URISyntaxException, IOException {

        gc = drawArea.getGraphicsContext2D();
        Image stars = new Image("sample/star.png");
        gc.clearRect(0,0,400,741);



        int fromVertex = fromCombo.getSelectionModel().getSelectedIndex();// Get the index of the "from" vertex
        int toVertex = toCombo.getSelectionModel().getSelectedIndex();// Get the index of the "to" vertex



        if(fromVertex == -1 || toVertex == -1)// If there is no from vertex OR to vertex do NOT calculate the distance
            distanceField.setText("ادخل نقطتين من فضلك ");
        else if(fromVertex == toVertex )// If the "from" vertex is the same as "to" vertex the distance is ZERO
            distanceField.setText("المسافة = 0 كم");
        else
        {


            gc.drawImage(stars, vertices[fromVertex].getX_center() - 10, vertices[fromVertex].getY_center() - 10);
            gc.drawImage(stars, vertices[toVertex].getX_center() - 10, vertices[toVertex].getY_center() - 10);


            table = new Dijkstra[tracker];
            intializeTable(fromVertex);// Intialize the dijkstra table
            try {
                dijkstra();// Find the distance between the from vertex to all other vertices
            } catch (CloneNotSupportedException ex) {
            }
            distanceField.setText("المسافة = "+String.valueOf(table[toVertex].distance) + " كم");//Print the distance on the label
            // To Draw the lines
            int tmp = 0;
            ArrayList list = new ArrayList<String>(2);// To Print the Path
            do{
                list.add(table[toVertex].header.name);
                for (int i = 0; i < tracker; i++)
                    if(table[toVertex].path.id == vertices[i].id)// Get the index of the vertex
                        tmp = i;
//                gc = drawArea.getGraphicsContext2D();

                gc.strokeLine(vertices[tmp].x_center, vertices[tmp].y_center, vertices[toVertex].x_center, vertices[toVertex].y_center);
                toVertex = tmp;// make he "to" vertex equals the previous vertex
            }while(vertices[tmp].id != vertices[fromVertex].id);// Loop until the previous vertex is the same as the "from" vertex
            list.add(table[fromVertex].header.name);
            String st = "";
            for (int i = list.size()-1; i >= 0; i--){
                st += list.get(i);
                if(i != 0)
                    st += "-> ";
            }
            System.out.println(st);
            //st = fix(st);
            pathField.setText(st);// Print the path
        }
    }

    public void BuildGraph(){


//        System.out.println("jghfhgdgfsdfghg "+ vertices[0]);

        String[][] temp = GetS("edges");// Get the edges from the database

        edges =  new String[temp.length];

        for (int i = 0; i < temp.length; i++) {
            //Add a direct edge from A vertex to B vertex and vise verca
            int from = 0, to = 0;
            for (int j = 0; j < tracker; j++) {
                if(Integer.parseInt(temp[i][1]) == vertices[j].id)
                    from = j;
                if(Integer.parseInt(temp[i][2]) == vertices[j].id)
                    to = j;
            }
            vertices[from].addNeighbor(to, Integer.parseInt(temp[i][3]));
            vertices[to].addNeighbor(from, Integer.parseInt(temp[i][3]));
            edges[i] = (String.valueOf(from) + " -- " + String.valueOf(to));

//            System.out.println("\n\n"++"\n\n");

        }

    }

    @FXML
    private void open() throws URISyntaxException, IOException {

//        System.out.println(current);
//        System.out.println(vertices[current].getUrl());

        String text = new String(vertices[current].getUrl().getBytes(),"UTF-8");

        text = text.replace("%", "%25").replace("\\", "\u00A8").replace(" ", "%20")
                .replace("\n", "%0D%0A").replace("\"", "\u00A8")
                .replace(";", "%3B").replace("?", "%3F")
                .replace("&", "%24").replace("$", "%26")
                .replace("<", "%3C").replace(">", "%3E")
                .replace("~", "%7E").replace("ü", "\u00fc")
                .replace("ä", "\u00e4").replace("ö", "\u00f6")
                .replace("Ü", "\u00dc").replace("Ä", "\u00c4")
                .replace("Ö", "\u00d6").replace("ß", "\u00df");

        Desktop desktop = Desktop.getDesktop();
        desktop.browse(new URI(text));

    }

    @FXML
    private void exit(){
        System.exit(0);
    }

    public String[][] GetS(String entity) {


        String[][] st={{}};
        int numRows;
        int j=0;

        String SQL2;
        try {

            numRows = getNumRows(entity);

            st = new String[numRows][15];
//		SQL = "select * from students";
            SQL2 = "select * from `graph`.`edges`";

            Connection cnn = new DB_Connection().getConnection();

            Statement stmt = cnn.createStatement();
            ResultSet rs = stmt.executeQuery(SQL2);

            int numCols = rs.getMetaData().getColumnCount();


            while ( rs.next() ) {
                for (int i=1; i<=numCols; i++) {
                    // st[j][i-1]=   new String(rs.getString(i));
                    st[j][i-1] = rs.getString(i);
                    System.out.println(rs.getString(i));
                }	  // end for
                j++;
            }  // end while

            rs.close();
            stmt.close();



            return st;

        }
        catch(SQLException e) {
            e.printStackTrace();
        }
        return st;

    }

    public int getNumRows(String entity) throws SQLException {

        String SQL;

        int res = 0;

        SQL = "select count(*) from `graph`.`edges`";

        Connection cnn = new DB_Connection().getConnection();
        Statement stmt = cnn.createStatement();
        ResultSet rs = stmt.executeQuery(SQL);


        if ( rs.next() ) {
            res = rs.getInt(1);
        }  // end while

        rs.close();
        stmt.close();



        return res;

    }

    public void ReadVertices(){

        // Set the fields to default
        tracker = 0;
        fromCombo.getItems().clear();
        toCombo.getItems().clear();


        VertexDAO vertexDAO = new VertexDAO();


        ArrayList<Vertex> arrayList= vertexDAO.getAllVertices();

        vertices = new Vertex[vertexDAO.getAllVertices().size()];


        for (int i = 0; i < arrayList.size(); i++) {

            vertices[tracker++] = arrayList.get(i);
            fromCombo.getItems().add(vertices[tracker-1].name);// Add the vertex to "from" comboBox
            toCombo.getItems().add(vertices[tracker-1].name);// Add the vertex to "To" ComboBox


        }


    }

    public void intializeTable(int start){// Fucntion to intialize the table that will be use in dijkstra alogirthm
        for (int i = 0; i < tracker; i++) {
            table[i] = new Dijkstra();
            table[i].header = vertices[i];
            table[i].distance = Integer.MAX_VALUE;// Set the distance to every vertex to infinity
            table[i].path = null;// Set the previous vertex in path to - not a vertex -
        }
        table[start].distance = 0;// The distance between the start-start vertices to 0
    }

    public void dijkstra() throws CloneNotSupportedException{

        int v;
        DNode w;

        for( ; ; ){
            v = SmallestUnkownVertex();// Get the with the smallest unreached distance
            if(v == -1)// If there is no vertex then break
                break;
            table[v].known = true;// Set the reached flag to 1
            w = vertices[v].neighbors.next;// Point to the first adjacent
            while(w != null){
                if(!table[w.vertex].known)
                    if(table[v].distance + w.distance < table[w.vertex].distance ){
                        table[w.vertex].distance = table[v].distance + w.distance;
                        table[w.vertex].path = table[v].header;
                    }
                w = w.next;
            }
        }
    }
    public int SmallestUnkownVertex(){
        int min = Integer.MAX_VALUE;// Set the min distance to the maxInteger
        int index = -1;
        for (int i = 0; i < table.length; i++)
            if(table[i].distance < min && !table[i].known)// If the vertex is UnReached and it's distance is less than min then save the indes
            {
                index = i;
                min = table[i].distance;
            }
        return index;
    }

    public String fix(String data){
        String str="";
        try{
            str = new String(data.getBytes("ISO-8859-1"),"UTF-8");

        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        return str ;
    }






}
