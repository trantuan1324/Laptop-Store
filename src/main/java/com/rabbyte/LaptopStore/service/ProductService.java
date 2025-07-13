package com.rabbyte.LaptopStore.service;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {


    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public void handleCreateProduct(Product product) {
        this.productRepository.save(product);
    }

    public List<Product> handleGetAllProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> handleGetProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void handleUpdateProduct(long id, Product updatedProduct) {
        Optional<Product> data = this.productRepository.findById(id);
        Product product = new Product();

        if (data.isPresent()) {
            product = data.get();
            product.setName(updatedProduct.getName());
            product.setFactory(updatedProduct.getFactory());
            product.setPrice(updatedProduct.getPrice());
            product.setQuantity(updatedProduct.getQuantity());
            product.setDetailDesc(updatedProduct.getDetailDesc());
            product.setShortDesc(updatedProduct.getShortDesc());
            product.setTarget(updatedProduct.getTarget());
        }
    }
}
