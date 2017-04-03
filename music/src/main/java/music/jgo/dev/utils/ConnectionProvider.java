package music.jgo.dev.utils;

import java.sql.Driver;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

public class ConnectionProvider {

	 public SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
	 public JdbcTemplate jdbcTemplate;

	public void setDataSource(SimpleDriverDataSource dataSource) {
		this.dataSource = dataSource;
	}

	public ConnectionProvider() {
		
//SQL SERVER CONNECTION
		

		try {
			dataSource.setDriverClass((Class<Driver>) Class
					.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//jdbc:sqlserver://USUARIO-PC\\JGOSQLDEV:1433;databaseName=music
	dataSource
				.setUrl("jdbc:sqlserver://MAQ7:1433;databaseName=music");


	dataSource.setUsername("sa");
	dataSource.setPassword("12345678");
	this.jdbcTemplate = new JdbcTemplate(dataSource);
	
	
	/*
	
//MYSQL CONNECTION
		try {
			dataSource.setDriverClass((Class<Driver>) Class
					.forName("com.mysql.jdbc.Driver"));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		dataSource
		.setUrl("jdbc:mysql://localhost:3306/music");
		dataSource.setUsername("dev");
		dataSource.setPassword("music2016");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
*/
	}

}
