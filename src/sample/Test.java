package sample;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/**
 * Created by mohammedissa on 5/25/16.
 */
public class Test {

    public static void main(String[] args0) throws FileNotFoundException {


        File file = new File("/Users/mohammedissa/Dropbox/dr/workspace 2/algorithm_project3/src/sample/cities.txt");

        Scanner scanner = new Scanner(file);

        try {
            Connection cnn = new DB_Connection().getConnection();
            Statement stat = cnn.createStatement();
            int v1=0,v2=0;
            while (scanner.hasNext()) {
                String line = scanner.nextLine();

                ResultSet rs = stat.executeQuery("SELECT id FROM graph.vertices where name = '"+ line.split(",")[0]+"'");
                while (rs.next())
                     v1 = rs.getInt("id");

                ResultSet rs2 = stat.executeQuery("SELECT id FROM graph.vertices where name = '"+ line.split(",")[1]+"'");
                while (rs2.next())
                    v2 = rs2.getInt("id");



//                ResultSet rs2 = stat.executeQuery("SELECT id FROM graph.vertices where name = '"+ line.split(",")[1]+"'");
//                int v2 = rs2.getInt("id");

                int dis = Integer.parseInt(line.split(",")[2]);

                stat.executeUpdate("INSERT INTO `graph`.`edges` (`vertexNode1`, `vertexNode2`, `distance`) VALUES('"
                        + v1+  "', '"
                        +  v2+"', '"
                        + dis+ "');");

                System.out.println("v1  "+v1+"   v2  "+v2+"  dis   "+dis);
            }
        } catch (SQLException ex) {
            System.out.println("sql problem");
            System.out.println(ex.getMessage());
        }


    }

}
