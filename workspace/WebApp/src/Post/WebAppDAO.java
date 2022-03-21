package Post;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class WebAppDAO {
	
	public int pageNumber() throws IOException {
		int count=0;
		BufferedReader reader = new BufferedReader(new FileReader("C:/work/eGovFrameDev-3.8.0-64bit/workspace/WebApp/WebContent/Java/DataBase/Data.txt"));
		String str = "";
		while((str = reader.readLine()) != null) {
			count++;
		}
		int result = (int) Math.ceil((double)count/5);
		return result;
	}
	
	public void write(String Title, String Content, String Writer) throws IOException{
		File f = new File("C:/work/eGovFrameDev-3.8.0-64bit/workspace/WebApp/WebContent/Java/DataBase/Data.txt");
		BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(f, true));
		String result = "/"+Title+"/"+Content+"/"+Writer+"/"+LocalDate.now()+"/1";
		bufferedWriter.newLine();
		bufferedWriter.write(result);
		bufferedWriter.flush();
		
	}
	
	public boolean nextPage(int pageNumber) {
		try {
			if(pageNumber() >= pageNumber) {
				return true;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Post> getList(int pageNumber) throws Exception, IOException {
		ArrayList<Post> list = new ArrayList<Post>();
		ArrayList<Post> result = new ArrayList<Post>();
		BufferedReader reader = new BufferedReader(new FileReader("C:/work/eGovFrameDev-3.8.0-64bit/workspace/WebApp/WebContent/Java/DataBase/Data.txt"));
		int as = pageNumber();
		int big = pageNumber*5;
		int small = (pageNumber-1) * 5;
		int count = 0;
		String str;
		while((str = reader.readLine()) != null) {
				String[] ls = str.split("/");
				Post pos = new Post();
				pos.setType(ls[0]);
				pos.setTitle(ls[1]);
				pos.setContent(ls[2]);
				pos.setWriter(ls[3]);
				pos.setDate(ls[4]);
				pos.setCount(Integer.parseInt(ls[5]));
				list.add(pos);
				count++;
			}
		reader.close();
		if(big < count) {
			for(int i=small; i<big; i++) {
				result.add(list.get(i));
			}
		}else if(count < big) {
			for(int i=small; i<count; i++) {
				result.add(list.get(i));	
			}
		}
		
		return result;
	}
}
