package repository.impl;

import model.Division;
import model.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private final String SELECT_ALL = "select * from `position` ;";
    @Override
    public List<Position> findAll() {
        List<Position> positions = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("position_id");
                String name = resultSet.getString("position_name");
                Position position = new Position(id,name);
                positions.add(position);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return positions;
    }
}
