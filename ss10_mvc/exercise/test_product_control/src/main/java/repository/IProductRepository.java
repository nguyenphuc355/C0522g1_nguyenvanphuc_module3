package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void createProduct(Product product);

    Product findById(int id);

    void updateProduct(int id, Product product);

    void remove(int id);

}
