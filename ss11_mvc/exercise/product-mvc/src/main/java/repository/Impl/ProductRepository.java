package repository.Impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add( new Product(1, "iphone 12", "17000000", "new", "Apple"));
        productList.add( new Product(2, "iphone 13", "20000000", "likeNew", "Apple"));
        productList.add( new Product(3, "oppo reno7", "19000000", "new", "Oppo"));
        productList.add( new Product(4, "samsung note 20ultra", "24000000", "new", "Samsung"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.add(product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item :
                productList) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }

    @Override
    public Product searchByID(int id) {

        return productList.get(id);
    }
}

