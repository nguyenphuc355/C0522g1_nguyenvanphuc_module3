package service;

import model.Position;

import java.nio.file.Path;
import java.util.List;

public interface IPositionService {
    List<Position> findAll();
}
