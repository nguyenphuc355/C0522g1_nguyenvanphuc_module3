package service.impl;


import model.Product;
import repository.Impl.ProductRepository;
import repository.IProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return productRepository.findAll();
    }

    @Override
    public void addNew(Product product) {
        productRepository.save(product);

    }

    @Override
    public void update(Product product) {
        productRepository.findById(product.getId());
    }


    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public void view(int id) {

    }


    @Override
    public Product searchByID(int id) {
        return productRepository.searchByID(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.search(name);
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }
}