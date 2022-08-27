package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void createProduct(Product product);

    Product findProductById(int id);

    void updateProduct(int id, Product product);

    void remove(int id);

    List<Product> search(String name);

    Product searchById(int id);
}
