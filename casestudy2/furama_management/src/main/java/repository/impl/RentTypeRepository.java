package repository.impl;

import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private final String RENT_TYPE = "select * from rent_type;";

    @Override
    public List<RentType> findAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(RENT_TYPE);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("rent_type_id");
                String name = resultSet.getString("rent_type_name");

                RentType rentType = new RentType(id, name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
