import java.util.Arrays;
import java.util.Scanner;

class Product {
    int productId;
    String productName;
    String category;

    public Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public String toString() {
        return "Product ID: " + productId + ", Name: " + productName + ", Category: " + category;
    }
}

public class ProductSearch {

    public static Product linear(Product[] arr, int id) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].productId == id) return arr[i];
        }
        return null;
    }

    public static Product binary(Product[] arr, int id) {
        int l = 0, r = arr.length - 1;
        while (l <= r) {
            int m = (l + r) / 2;
            if (arr[m].productId == id) return arr[m];
            if (arr[m].productId < id) l = m + 1;
            else r = m - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        System.out.print("Enter number of products: ");
        n = sc.nextInt();
        sc.nextLine();

        Product[] arr = new Product[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter product ID: ");
            int productId = sc.nextInt();
            sc.nextLine();
            System.out.print("Enter product name: ");
            String productName = sc.nextLine();
            System.out.print("Enter category: ");
            String category = sc.nextLine();
            arr[i] = new Product(productId, productName, category);
        }

        Arrays.sort(arr, (a, b) -> a.productId - b.productId);

        System.out.print("Enter product ID to search: ");
        int target = sc.nextInt();

        Product res1 = linear(arr, target);
        if (res1 != null)
            System.out.println("Found using linear: " + res1);
        else
            System.out.println("Not found using linear.");

        Product res2 = binary(arr, target);
        if (res2 != null)
            System.out.println("Found using binary: " + res2);
        else
            System.out.println("Not found using binary.");

        sc.close();
    }
}