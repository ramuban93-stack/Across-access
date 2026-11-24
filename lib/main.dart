import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const AcrossAccessApp());
}

const blue = Color(0xFF1877F2);
const darkBlue = Color(0xFF123B70);
const lightBlue = Color(0xFFEAF3FF);

class Product {
  final String name;
  final String category;
  final double price;
  final String image;
  final String description;
  final String condition;
  final String country;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.condition,
    required this.country,
  });
}

class AcrossAccessApp extends StatelessWidget {
  const AcrossAccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Across Access',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          primary: blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String page = 'home';
  String lessonTitle = '';
  String selectedCategory = 'All';
  Product? selectedProduct;
final ImagePicker imagePicker = ImagePicker();
File? selectedImage;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  String sellCategory = 'Electronics';
  String sellCondition = 'New';
Future<void> pickImage(ImageSource source) async {
  final XFile? pickedFile = await imagePicker.pickImage(
    source: source,
    imageQuality: 80,
  );

  if (pickedFile != null) {
    setState(() {
      selectedImage = File(pickedFile.path);
    });
  }
}
}
  final List<Product> products = [
    Product(
      name: 'Wireless Earbuds',
      category: 'Electronics',
      price: 1500,
      image: '',
      description: 'Wireless earbuds with charging case.',
      condition: 'New',
      country: 'Nepal',
    ),
    Product(
      name: 'Smart Watch',
      category: 'Electronics',
      price: 2500,
      image: '',
      description: 'Smart watch for everyday use.',
      condition: 'New',
      country: 'Nepal',
    ),
    Product(
      name: 'Travel Backpack',
      category: 'Other',
      price: 1200,
      image: '',
      description: 'Large backpack for travel and daily use.',
      condition: 'New',
      country: 'Nepal',
    ),
    Product(
      name: 'Sports Shoes',
      category: 'Shoes',
      price: 2200,
      image: '',
      description: 'Comfortable shoes for walking and sports.',
      condition: 'New',
      country: 'Nepal',
    ),
    Product(
      name: 'Study Lamp',
      category: 'Furniture',
      price: 800,
      image: '',
      description: 'Desk lamp for study and work.',
      condition: 'New',
      country: 'Nepal',
    ),
    Product(
      name: 'Mobile Phone',
      category: 'Mobiles',
      price: 12000,
      image: '',
      description: 'Used mobile phone in good condition.',
      condition: 'Second-hand',
      country: 'Nepal',
    ),
  ];

  final List<Product> cart = [];
  final List<Product> wishlist = [];
  final List<Product> myListings = [];

  final List<String> categories = [
    'All',
    'Electronics',
    'Mobiles',
    'Clothes',
    'Shoes',
    'Vehicles',
    'Furniture',
    'Agriculture',
    'Other',
  ];

  final List<String> incomeIdeas = [
    'Freelancing',
    'Graphic Design',
    'Video Editing',
    'Content Writing',
    'Social Media Management',
    'Digital Marketing',
    'YouTube Creator',
    'Facebook Content Creator',
    'Online Teaching',
    'Photography',
    'Web Development',
    'App Development',
    'Affiliate Marketing',
    'Online Store',
    'Dropshipping',
    'Local Business',
    'Reselling Products',
    'Tutoring',
    'Translation',
    'Virtual Assistant',
    'Data Entry',
    'Customer Support',
    'SEO Services',
    'Blogging',
    'Podcasting',
    'Voice Over',
    'Animation',
    'UI/UX Design',
    'Logo Design',
    'Video Production',
    'Copywriting',
    'Email Marketing',
    'E-commerce',
    'Print on Demand',
    'Handmade Products',
    'Food Business',
    'Agriculture Business',
    'Livestock Farming',
    'Fish Farming',
    'Nursery Business',
    'Repair Services',
    'Mobile Repair',
    'Computer Repair',
    'Photography Business',
    'Event Management',
    'Travel Guide',
    'Tourism Business',
    'Taxi Service',
    'Delivery Service',
    'Car Wash',
    'Cleaning Services',
    'Beauty Services',
    'Barber Services',
    'Fitness Coaching',
    'Yoga Instructor',
    'Music Teaching',
    'Dance Teaching',
    'Online Courses',
    'Selling E-books',
    'Selling Templates',
    'Selling Digital Art',
    'Stock Photography',
    'Stock Video',
    'Website Flipping',
    'Domain Investing',
    'Software Services',
    'IT Consulting',
    'Cybersecurity Learning',
    'Accounting Services',
    'Bookkeeping',
    'Tax Assistance',
    'Business Consulting',
    'Market Research',
    'Sales Representative',
    'Direct Selling',
    'Network Marketing',
    'Product Distribution',
    'Wholesale Business',
    'Retail Shop',
    'Grocery Store',
    'Clothing Business',
    'Shoe Business',
    'Electronics Shop',
    'Furniture Business',
    'Online Marketplace Seller',
    'Second-hand Trading',
    'Home Based Business',
    'Candle Making',
    'Soap Making',
    'Craft Business',
    'Jewelry Making',
    'Baking Business',
    'Meal Delivery',
    'Catering',
    'Organic Products',
    'Local Farming',
    'Freelance Consulting',
    'Remote Employment',
    'Part-time Jobs',
    'Skill-based Services',
    'Build Your Own App',
  ];

  final List<String> jobTopics = [
    'Online Jobs',
    'Freelancing',
    'Local Jobs',
    'Digital Marketing',
    'Network Marketing',
    'Share Market Knowledge',
    'Small Business',
    '100 Income Ideas',
  ];

  void go(String newPage) {
    FocusScope.of(context).unfocus();
    setState(() => page = newPage);
  }

  void openProduct(Product product) {
    setState(() {
      selectedProduct = product;
      page = 'product';
    });
  }

  void openLesson(String title) {
    setState(() {
      lessonTitle = title;
      page = 'lesson';
    });
  }

  void back() {
    if (page == 'product') {
      go('sales');
    } else if (page == 'sell') {
      go('sales');
    } else if (page == 'cart' || page == 'checkout') {
      go('sales');
    } else if (page == 'lesson') {
      go('jobs');
    } else {
      go('home');
    }
  }

  void addToCart(Product product) {
    setState(() => cart.add(product));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
  }

  void toggleWishlist(Product product) {
    setState(() {
      if (wishlist.contains(product)) {
        wishlist.remove(product);
      } else {
        wishlist.add(product);
      }
    });
  }

  double get totalPrice =>
      cart.fold(0, (sum, product) => sum + product.price);

  void publishProduct() {
    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim());

    if (name.isEmpty || price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter product name and valid price')),
      );
      return;
    }

    final newProduct = Product(
      name: name,
      category: sellCategory,
      price: price,
      image: imageController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? 'No description provided.'
          : descriptionController.text.trim(),
      condition: sellCondition,
      country: countryController.text.trim().isEmpty
          ? 'Not specified'
          : countryController.text.trim(),
    );

    setState(() {
      products.insert(0, newProduct);
      myListings.add(newProduct);
      nameController.clear();
      priceController.clear();
      imageController.clear();
      descriptionController.clear();
      countryController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product published successfully!')),
    );
    go('sales');
  }

  Widget productImage(String url, {double height = 130}) {
    if (url.trim().isEmpty) {
      return Container(
        height: height,
        color: lightBlue,
        child: const Center(
          child: Icon(Icons.shopping_bag, size: 55, color: blue),
        ),
      );
    }

    return Image.network(
      url,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        height: height,
        color: lightBlue,
        child: const Center(
          child: Icon(Icons.broken_image, size: 45, color: blue),
        ),
      ),
    );
  }

  Widget mainCard(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback action,
  ) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: lightBlue,
          child: Icon(icon, color: blue),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: action,
      ),
    );
  }

  Widget buildHome() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [blue, darkBlue],
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YOUR WORLD.\nONE PLATFORM.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'One platform, many possibilities',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 10),
              Text(
                'Learn • Earn • Buy • Sell • Grow',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        mainCard('Sales Marketplace', 'Buy and sell products', Icons.store,
            () => go('sales')),
        mainCard('Jobs & Income', 'Jobs, skills and income ideas',
            Icons.work, () => go('jobs')),
        mainCard('Learn & Earn', 'Learn practical skills', Icons.school,
            () => go('learning')),
        mainCard('Across AI', 'Your AI assistant space', Icons.smart_toy,
            () => go('ai')),
        mainCard('My Profile', 'My account and activity', Icons.person,
            () => go('profile')),
      ],
    );
  }

  Widget buildSales() {
    final query = searchController.text.toLowerCase();

    final filteredProducts = products.where((product) {
      final matchesCategory = selectedCategory == 'All' ||
          product.category == selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: blue,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ACROSS MARKETPLACE',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text('Buy • Sell • Connect', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: searchController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'Search products...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 7,
          runSpacing: 7,
          children: categories.map((category) {
            return ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (_) {
                setState(() => selectedCategory = category);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => openProduct(product),
                      child: SizedBox(
                        width: double.infinity,
                        child: productImage(product.image, height: 140),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Rs. ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product.condition,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          wishlist.contains(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: wishlist.contains(product)
                              ? Colors.red
                              : blue,
                        ),
                        onPressed: () => toggleWishlist(product),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.add_shopping_cart, color: blue),
                          onPressed: () => addToCart(product),
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.open_in_new, color: blue),
                        onPressed: () => openProduct(product),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        if (filteredProducts.isEmpty)
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(child: Text('No products found')),
          ),
      ],
    );
  }

  Widget buildProductDetail() {
    final product = selectedProduct;
    if (product == null) return const SizedBox();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: productImage(product.image, height: 260),
        ),
        const SizedBox(height: 15),
        Text(
          product.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Rs. ${product.price.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 22,
            color: blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text('Category: ${product.category}'),
        Text('Condition: ${product.condition}'),
        Text('Country: ${product.country}'),
        const Divider(height: 28),
        const Text('Product Description',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(product.description),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => addToCart(product),
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Add to Cart'),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => go('cart'),
          icon: const Icon(Icons.shopping_cart),
          label: Text('View Cart (${cart.length})'),
        ),
        OutlinedButton.icon(
          onPressed: () => toggleWishlist(product),
          icon: const Icon(Icons.favorite_border),
          label: const Text('Add to Wishlist'),
        ),
      ],
    );
  }

  Widget buildSellPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'SELL YOUR PRODUCT',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Enter product details and a public image URL to display your product photo.',
        ),
        const SizedBox(height: 15),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Product Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: sellCategory,
          decoration: const InputDecoration(
            labelText: 'Category',
            border: OutlineInputBorder(),
          ),
          items: categories.where((c) => c != 'All').map((category) {
            return DropdownMenuItem(value: category, child: Text(category));
          }).toList(),
          onChanged: (value) {
            if (value != null) setState(() => sellCategory = value);
          },
        ),
        const SizedBox(height: 12),
        TextField(
          controller: priceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Price (Rs.)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: sellCondition,
          decoration: const InputDecoration(
            labelText: 'Product Quality',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'New', child: Text('New')),
            DropdownMenuItem(
                value: 'Second-hand', child: Text('Second-hand')),
          ],
          onChanged: (value) {
            if (value != null) setState(() => sellCondition = value);
          },
        ),
        const SizedBox(height: 12),
        TextField(
          controller: countryController,
          decoration: const InputDecoration(
            labelText: 'Country / Location',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      'Product Photo',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 10),

    Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => pickImage(ImageSource.gallery),
            icon: const Icon(Icons.photo_library),
            label: const Text('Gallery'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => pickImage(ImageSource.camera),
            icon: const Icon(Icons.camera_alt),
            label: const Text('Camera'),
          ),
        ),
      ],
    ),

    const SizedBox(height: 12),

    if (selectedImage != null)
      ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.file(
          selectedImage!,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      )
    else
      Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_a_photo, size: 45, color: Colors.blue),
              SizedBox(height: 8),
              Text('Select or capture product photo'),
            ],
          ),
        ),
      ),
  ],
)

      
        const SizedBox(height: 12),
        TextField(
          controller: descriptionController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Describe your product...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 18),
        ElevatedButton.icon(
          onPressed: publishProduct,
          icon: const Icon(Icons.publish),
          label: const Text('Publish Product'),
        ),
      ],
    );
  }

  Widget buildCart() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('MY CART',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        if (cart.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('Your cart is empty. Add products first!'),
            ),
          ),
        ...cart.asMap().entries.map((entry) {
          final index = entry.key;
          final product = entry.value;
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 55,
                child: productImage(product.image, height: 60),
              ),
              title: Text(product.name),
              subtitle: Text('Rs. ${product.price.toStringAsFixed(0)}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() => cart.removeAt(index));
                },
              ),
            ),
          );
        }),
        if (cart.isNotEmpty) ...[
          const Divider(),
          Text(
            'Total: Rs. ${totalPrice.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => go('checkout'),
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ],
    );
  }

  Widget buildCheckout() {
    String paymentMethod = 'Cash on Delivery';

    return StatefulBuilder(
      builder: (context, localSetState) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'CHECKOUT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text('Total Amount: Rs. ${totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 21, color: blue)),
            const SizedBox(height: 15),
            const Text('Select Payment Method'),
            RadioListTile<String>(
              title: const Text('Cash on Delivery'),
              value: 'Cash on Delivery',
              groupValue: paymentMethod,
              onChanged: (value) =>
                  localSetState(() => paymentMethod = value!),
            ),
            RadioListTile<String>(
              title: const Text('UPI / Wallet (Demo)'),
              value: 'UPI / Wallet',
              groupValue: paymentMethod,
              onChanged: (value) =>
                  localSetState(() => paymentMethod = value!),
            ),
            RadioListTile<String>(
              title: const Text('Card (Demo)'),
              value: 'Card',
              groupValue: paymentMethod,
              onChanged: (value) =>
                  localSetState(() => paymentMethod = value!),
            ),
            const SizedBox(height: 15),
            const Text(
              'Note: This is a demo checkout. No real payment or order is sent.',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Demo Order'),
                    content: Text(
                      'Payment method: $paymentMethod\n'
                      'Total: Rs. ${totalPrice.toStringAsFixed(0)}\n\n'
                      'No real payment has been made.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() => cart.clear());
                          go('sales');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Confirm Demo Order'),
            ),
          ],
        );
      },
    );
  }

  Widget buildJobs() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Text(
            'JOBS & INCOME\nLearn skills. Find opportunities. Grow.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...jobTopics.map((topic) => mainCard(
              topic,
              'Learn how to start and improve',
              Icons.lightbulb_outline,
              () => openLesson(topic),
            )),
      ],
    );
  }

  Widget buildLesson() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          lessonTitle,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          lessonContent(lessonTitle),
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 20),
        const Text(
          'Action Plan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '1. Learn the basics every day.\n'
          '2. Practice one small task.\n'
          '3. Create a sample project.\n'
          '4. Build a portfolio or profile.\n'
          '5. Start looking for real opportunities.\n'
          '6. Improve from feedback.\n'
          '7. Keep track of your progress.',
          style: TextStyle(height: 1.7),
        ),
        const SizedBox(height: 20),
        const Text(
          'Remember: Income is not guaranteed. Avoid scams, never pay '
          'large fees to get a job, and research before investing money.',
          style: TextStyle(color: Colors.red, height: 1.5),
        ),
      ],
    );
  }

  String lessonContent(String title) {
    if (title == '100 Income Ideas') {
      return 'Explore 100 income ideas below. Choose one skill that matches '
          'your interest and resources, learn it, practice, and start small.\n\n'
          '${incomeIdeas.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n')}';
    }

    if (title == 'Share Market Knowledge') {
      return 'SHARE MARKET BEGINNER GUIDE\n\n'
          '• Learn what shares and stock markets are.\n'
          '• Understand investing versus trading.\n'
          '• Learn IPO, DEMAT, broker and market order basics.\n'
          '• Study revenue, profit, debt, cash flow and dividends.\n'
          '• Learn EPS and P/E carefully.\n'
          '• Diversify; avoid investing all money in one company.\n'
          '• Do not borrow to invest.\n'
          '• Practice with a simulator before using real money.\n'
          '• Understand risks; returns are never guaranteed.';
    }

    if (title == 'Network Marketing') {
      return 'NETWORK MARKETING LEARNING\n\n'
          '• Understand the product and its real value.\n'
          '• Learn how commissions are calculated.\n'
          '• Check the company, costs, refund rules and income disclosures.\n'
          '• Income should depend on real product sales, not only recruitment.\n'
          '• Do not pressure family or friends.\n'
          '• Avoid loans and buying large amounts of inventory.\n'
          '• Track expenses and actual profit.';
    }

    if (title == 'Digital Marketing') {
      return 'DIGITAL MARKETING\n\n'
          '• Social media marketing\n'
          '• Content creation\n'
          '• Search engine optimization (SEO)\n'
          '• Paid advertising basics\n'
          '• Email marketing\n'
          '• Affiliate marketing\n'
          '• Audience research\n'
          '• Analytics and reporting\n'
          '• Client communication\n\n'
          'Practice by creating a sample page and making a weekly content plan.';
    }

    if (title == 'Freelancing') {
      return 'FREELANCING STARTER GUIDE\n\n'
          '1. Select one skill: design, writing, video editing or coding.\n'
          '2. Practice and create three sample works.\n'
          '3. Make a simple portfolio.\n'
          '4. Create a professional profile.\n'
          '5. Apply for suitable jobs with custom proposals.\n'
          '6. Agree on deliverables and payment terms.\n'
          '7. Keep records and communicate clearly.';
    }

    if (title == 'Online Jobs') {
      return 'ONLINE JOBS GUIDE\n\n'
          'Potential roles include virtual assistant, customer support, '
          'content writing, design, data work, translation, teaching, '
          'marketing and programming.\n\n'
          'Prepare a CV, learn the required skills, practice interviews, '
          'and check employers carefully. Never pay suspicious job fees '
          'or share OTPs and passwords.';
    }

    if (title == 'Local Jobs') {
      return 'LOCAL JOB GUIDE\n\n'
          '• Identify local businesses and services.\n'
          '• Prepare a simple CV and contact details.\n'
          '• Visit or contact employers respectfully.\n'
          '• Learn the job requirements and salary conditions.\n'
          '• Check the work hours, location and safety.\n'
          '• Build skills and request feedback.';
    }

    if (title == 'Small Business') {
      return 'SMALL BUSINESS STARTER\n\n'
          '• Find a customer problem.\n'
          '• Research demand before spending.\n'
          '• Start with a small test.\n'
          '• Calculate all costs and profit.\n'
          '• Keep records.\n'
          '• Provide good service.\n'
          '• Improve from customer feedback.';
    }

    return 'LEARNING GUIDE: $title\n\n'
        'Start by understanding the basics of $title. Search for reliable '
        'learning resources, practice with small real-world tasks, and '
        'build examples of your work.\n\n'
        'Steps:\n'
        '1. Learn the basic concepts.\n'
        '2. Practice for 30–60 minutes daily.\n'
        '3. Create a sample project.\n'
        '4. Learn from mistakes.\n'
        '5. Build your portfolio.\n'
        '6. Look for opportunities.\n'
        '7. Continue improving.';
  }

  Widget buildLearning() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'LEARN & GROW',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        mainCard('100 Income Ideas', 'Explore income opportunities',
            Icons.monetization_on, () => openLesson('100 Income Ideas')),
        mainCard('Digital Marketing', 'Learn online marketing',
            Icons.campaign, () => openLesson('Digital Marketing')),
        mainCard('Share Market Knowledge', 'Investing basics and risks',
            Icons.show_chart, () => openLesson('Share Market Knowledge')),
        mainCard('Network Marketing', 'Understand ethical selling',
            Icons.people, () => openLesson('Network Marketing')),
        mainCard('Freelancing', 'Work with skills',
            Icons.laptop_mac, () => openLesson('Freelancing')),
        mainCard('Online Jobs', 'Find remote work',
            Icons.work_outline, () => openLesson('Online Jobs')),
      ],
    );
  }

  Widget buildProfile() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundColor: lightBlue,
          child: Icon(Icons.person, size: 50, color: blue),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Across Access User',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        mainCard('My Listings', 'Products I have published',
            Icons.inventory, () => go('listings')),
        mainCard('My Wishlist', 'Saved products',
            Icons.favorite, () => go('wishlist')),
        mainCard('My Cart', 'Products ready to buy (${cart.length})',
            Icons.shopping_cart, () => go('cart')),
        mainCard('My Orders', 'Demo order information',
            Icons.receipt_long, () => go('orders')),
        mainCard('Seller Profile', 'Selling on Across Access',
            Icons.storefront, () => go('sell')),
        const SizedBox(height: 20),
        const Text(
          'Created by Ramu Ban',
          textAlign: TextAlign.center,
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildSimpleList(List<Product> list, String emptyMessage) {
    if (list.isEmpty) {
      return Center(child: Text(emptyMessage));
    }

    return ListView(
      padding: const EdgeInsets.all(12),
      children: list.map((product) {
        return Card(
          child: ListTile(
            leading: SizedBox(
              width: 60,
              child: productImage(product.image, height: 60),
            ),
            title: Text(product.name),
            subtitle: Text('Rs. ${product.price.toStringAsFixed(0)}'),
            onTap: () => openProduct(product),
          ),
        );
      }).toList(),
    );
  }

  Widget buildOrders() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Orders are currently demo only.\n'
          'Real order tracking will be added after backend setup.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String pageTitle() {
    switch (page) {
      case 'home':
        return 'Across Access';
      case 'sales':
        return 'Sales Marketplace';
      case 'jobs':
        return 'Jobs & Income';
      case 'learning':
        return 'Learn & Earn';
      case 'product':
        return 'Product Details';
      case 'sell':
        return 'Sell Product';
      case 'cart':
        return 'My Cart';
      case 'checkout':
        return 'Checkout';
      case 'lesson':
        return 'Learning';
      case 'profile':
        return 'Profile';
      case 'listings':
        return 'My Listings';
      case 'wishlist':
        return 'Wishlist';
      case 'orders':
        return 'My Orders';
      case 'ai':
        return 'Across AI';
      default:
        return 'Across Access';
    }
  }

  Widget pageBody() {
    switch (page) {
      case 'home':
        return buildHome();
      case 'sales':
        return buildSales();
      case 'jobs':
        return buildJobs();
      case 'learning':
        return buildLearning();
      case 'product':
        return buildProductDetail();
      case 'sell':
        return buildSellPage();
      case 'cart':
        return buildCart();
      case 'checkout':
        return buildCheckout();
      case 'lesson':
        return buildLesson();
      case 'profile':
        return buildProfile();
      case 'listings':
        return buildSimpleList(myListings, 'You have not published products yet.');
      case 'wishlist':
        return buildSimpleList(wishlist, 'Your wishlist is empty.');
      case 'orders':
        return buildOrders();
      case 'ai':
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Across AI\n\nYour AI assistant will be connected in a future update.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
        );
      default:
        return buildHome();
    }
  }

  bool showBottomNav() {
    return page == 'home' ||
        page == 'sales' ||
        page == 'jobs' ||
        page == 'learning' ||
        page == 'profile' ||
        page == 'ai';
  }

  int currentNavIndex() {
    if (page == 'sales') return 1;
    if (page == 'jobs' || page == 'learning') return 2;
    if (page == 'ai') return 3;
    if (page == 'profile') return 4;
    return 0;
  }

  void onNavTap(int index) {
    switch (index) {
      case 0:
        go('home');
        break;
      case 1:
        go('sales');
        break;
      case 2:
        go('jobs');
        break;
      case 3:
        go('ai');
        break;
      case 4:
        go('profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && page != 'home') back();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: page == 'home'
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: back,
                ),
          title: Text(pageTitle()),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => go('cart'),
              tooltip: 'Cart',
            ),
          ],
        ),
        body: pageBody(),
        floatingActionButton: page == 'sales'
            ? FloatingActionButton.extended(
                onPressed: () => go('sell'),
                backgroundColor: blue,
                foregroundColor: Colors.white,
                icon: const Icon(Icons.add),
                label: const Text('Sell Product'),
              )
            : null,
        bottomNavigationBar: showBottomNav()
            ? NavigationBar(
                selectedIndex: currentNavIndex(),
                onDestinationSelected: onNavTap,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.store_outlined),
                    selectedIcon: Icon(Icons.store),
                    label: 'Sales',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.work_outline),
                    selectedIcon: Icon(Icons.work),
                    label: 'Jobs',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.smart_toy_outlined),
                    selectedIcon: Icon(Icons.smart_toy),
                    label: 'AI',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
