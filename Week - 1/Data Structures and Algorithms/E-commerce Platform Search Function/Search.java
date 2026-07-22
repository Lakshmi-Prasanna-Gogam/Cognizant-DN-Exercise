public class Search {
    public Product LinearSearch(Product[] products, int id) {
        for (Product p : products) {
            if (p.productId == id) {
                return p;
            }
        }
        return null;
    }

    public Product BinarySearch(Product[] products, int id) {
        int low = 0, high = products.length - 1;
        while (low <= high) {
            int mid = low + ((high - low) / 2);
            if (products[mid].productId == id)
                return products[mid];
            else if (products[mid].productId > id)
                high = mid - 1;
            else
                low = mid + 1;
        }
        return null;
    }
}
