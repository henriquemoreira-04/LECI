package aula04;

class Product {
    private String name;
    private double price;
    private int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public double getTotalValue() {
        return price * quantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int  getQuantity() {
        return quantity;
    }
}


class CashRegister {

    private final Product[] products = new Product[5];
    private int productCount = 0; 
    public void addProduct(Product p) {

        if (productCount < products.length) {
            products[productCount] = p; 
            productCount++; 
        } else {
            System.out.println("No se puede agregar más productos, el registro está lleno.");
        }
    }

    
    public double getTotalValue() {
        double total = 0;
        for (Product product : products) {
            if (product != null) {
                total += product.getTotalValue();
            }
        }
        return total;
    }

    
    public String toString() {
        String result = String.format("%-15s %10s %10s %7s\n", "Product", "Price", "Quantity", "Total");
        for (Product product : products) {
            if (product != null) {
                result += String.format("%-15s %10.2f %10d %7.2f\n", product.getName(), product.getPrice(), product.getQuantity(), product.getTotalValue());
            }
        }
        result += String.format("%s %.2f\n", "Total value: ", getTotalValue());
        return result;
    }
}


public class CashRegisterDemo {

    public static void main(String[] args) {

        
        CashRegister cr = new CashRegister();
        cr.addProduct(new Product("Book", 9.99, 3));
        cr.addProduct(new Product("Pen", 1.99, 10));
        cr.addProduct(new Product("Headphones", 29.99, 2));
        cr.addProduct(new Product("Notebook", 19.99, 5));
        cr.addProduct(new Product("Phone case", 5.99, 1));
        
        
        System.out.println(cr);
        

    }
}