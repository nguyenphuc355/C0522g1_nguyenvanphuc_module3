package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository repository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void createProduct(Product product) {
        repository.createProduct(product);
    }

    @Override
    public Product findProductById(int id) {
        return repository.findById(id);
    }

    @Override
    public void updateProduct(int id, Product product) {
        repository.updateProduct(id, product);
    }

    @Override
    public void remove(int id) {
        repository.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        return null;
    }

    @Override
    public Product searchById(int id) {
        return null;
    }
}
