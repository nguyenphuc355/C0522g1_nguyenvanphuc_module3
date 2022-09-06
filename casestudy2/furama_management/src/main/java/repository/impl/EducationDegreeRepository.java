package repository.impl;

import model.Division;
import model.EducationDegree;
import repository.BaseRepository;
import repository.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private final String SELECT_ALL = "select * from education_degree ;";
    @Override
    public List<EducationDegree> findAll() {
        List<EducationDegree> educationDegrees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("education_degree_id");
                String name = resultSet.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(id,name);
                educationDegrees.add(educationDegree);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return educationDegrees;
    }
}
