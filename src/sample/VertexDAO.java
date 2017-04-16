package sample;


import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by mohammedissa on 5/23/16.
 */
public class VertexDAO {


    public int getid(String name){

        int id =0;

        try {
            Connection cnn = new DB_Connection().getConnection();
            Statement stat = cnn.createStatement();


                ResultSet rs = stat.executeQuery("SELECT id FROM graph.vertices where name = '"+ name+"'");
                while (rs.next())
                    id = rs.getInt("id");


            } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;

    }
    public ArrayList<Vertex> getAllVertices(){


        ArrayList<Vertex> arrayList = new ArrayList<>();

        int id=0;
        String name="";
        int x1=0;// The lower x_coordinate
        int y1=0;// The lower y_coordinate
        int x2=0;// The upper x_coordinate
        int y2=0;// The upper y_coordinate
        int x_center=0;// The x_coordinate to draw the star
        int y_center=0;// The y_coordinate to draw the star
        String description="";// Inforamtion about the vertex
        String imagePath="";//Image Path for the vertex
        String url;

        String SQL2;
        try {




            SQL2 = "select * from `graph`.`vertices`";

            Connection cnn = new DB_Connection().getConnection();

            Statement stmt = cnn.createStatement();
            ResultSet rs = stmt.executeQuery(SQL2);



            while ( rs.next() ) {

                id = rs.getInt("id");
                name = rs.getString("name");
                x1 = rs.getInt("x1");
                y1 = rs.getInt("y1");
                x2 = rs.getInt("x2");
                y2 =rs.getInt("y2");
                x_center = rs.getInt("x_center");
                y_center=rs.getInt("y_center");
                description = rs.getString("description");
                imagePath =rs.getString("imagePath");
                url = rs.getString("url");

                Vertex vertex = new Vertex(id,name,(x1),y1,x2,(y2),(x_center),(y_center),description,imagePath,url);
                arrayList.add(vertex);

            }  // end while

            rs.close();
            stmt.close();




        }
        catch(SQLException e) {
            e.printStackTrace();
        }
        return arrayList;

    }

    public void inserVertex(Vertex e) {

        try {
            String name = new String(e.name.getBytes(),"UTF-8");
            String description = new String(e.description.getBytes(),"UTF-8");
            Connection cnn = new DB_Connection().getConnection();
            Statement stat = cnn.createStatement();
            stat.executeUpdate("INSERT INTO `graph`.`vertices` (`name`, `x1`, `y1`, `x2`, `y2`, `x_center`, `y_center`, `description`, `imagePath`) VALUES ('"
                    +name + "', '"
                    +e.x1 +"', '"
                    +e.y1 + "', '"
                    +e.x2 +"', '"
                    +e.y2 + "', '"
                    +e.x_center + "', '"
                    +e.y_center +"', '"
                    +description + "', '"
                    +e.imagePath + "');");

        } catch (SQLException ex) {
            System.out.println("sql problem");
            System.out.println(ex.getMessage());
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
    }

    public int getNumRows(String entity) throws SQLException {

        String SQL;

        int res = 0;

        SQL = "select count(*) from `graph`.`vertices`";

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


}
