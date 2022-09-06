package service.impl;

import model.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.impl.EducationDegreeRepository;
import service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private IEducationDegreeRepository degreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> findAll() {
        return degreeRepository.findAll();
    }
}
