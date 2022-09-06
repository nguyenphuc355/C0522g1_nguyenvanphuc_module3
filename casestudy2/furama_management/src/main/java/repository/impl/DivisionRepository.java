package repository.impl;

import model.CustomerType;
import model.Division;
import repository.BaseRepository;
import repository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private final String SELECT_ALL = "select * from division ;";
    @Override
    public List<Division> findAll() {
        List<Division> divisions = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("division_id");
                String name = resultSet.getString("division_name");
                Division division = new Division(id,name);
                divisions.add(division);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return divisions;
    }
}
