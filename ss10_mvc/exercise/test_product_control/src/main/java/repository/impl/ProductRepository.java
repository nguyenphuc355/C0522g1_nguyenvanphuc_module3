package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"abc","12000000","new","Apple"));
        products.put(2,new Product(2,"abc","12000000","new","Apple"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void createProduct(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public void updateProduct(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }

}
