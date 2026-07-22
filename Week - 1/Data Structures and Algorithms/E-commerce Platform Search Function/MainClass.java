import java.util.Arrays;
import java.util.Comparator;

public class MainClass {
    public static void main(String[] args) {
        Product[] products = {
                new Product(103, "Laptop", "Electronics"),
                new Product(105, "Mobile", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(104, "Watch", "Accessories"),
                new Product(101, "Bag", "Fashion")
        };

        Search s = new Search();

        int id = 102;

        Product ls = s.LinearSearch(products, id);
        if (ls != null) {
            System.out.println("Linear Search Result:");
            ls.prodDetails();
        }
        System.out.println();

        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));

        Product bs = s.BinarySearch(products, id);
        if (bs != null) {
            System.out.println("Binary Search Result:");
            bs.prodDetails();
        }
    }
}
