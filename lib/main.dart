
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const AcrossAccessApp());
}

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
    this.image = '',
    this.description = '',
    this.condition = 'New',
    this.country = '',
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
          seedColor: const Color(0xFF1877F2),
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
  String page = 'Home';
  String selectedCategory = 'All';
  String searchText = '';
  String lessonTitle = '';
  Product? selectedProduct;
  File? selectedImage;

  final ImagePicker imagePicker = ImagePicker();

  final searchController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final countryController = TextEditingController();

  String sellCategory = 'Electronics';
  String sellCondition = 'New';

  final categories = [
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

  final List<Product> products = [
    Product(
      name: 'Wireless Earbuds',
      category: 'Electronics',
      price: 1500,
      description: 'Wireless earbuds',
    ),
    Product(
      name: 'Smart Watch',
      category: 'Electronics',
      price: 2500,
      description: 'Smart watch',
    ),
    Product(
      name: 'Travel Backpack',
      category: 'Other',
      price: 1200,
      description: 'Travel backpack',
    ),
    Product(
      name: 'Sports Shoes',
      category: 'Shoes',
      price: 2200,
      description: 'Sports shoes',
    ),
    Product(
      name: 'Study Lamp',
      category: 'Furniture',
      price: 800,
      description: 'Study lamp',
    ),
    Product(
      name: 'Mobile Phone',
      category: 'Mobiles',
      price: 12000,
      description: 'Second-hand mobile',
      condition: 'Used',
    ),
  ];

  final List<Product> cart = [];
  final List<Product> wishlist = [];
  final List<Product> myListings = [];
  final List<Product> orders = [];

  final jobTopics = [
    'Online Jobs',
    'Freelancing',
    'Local Jobs',
    'Digital Marketing',
    'Network Marketing',
    'Share Market Knowledge',
    'Small Business',
    '100 Income Ideas',
  ];

  final incomeIdeas = [
    'Freelancing',
    'Graphic Design',
    'Video Editing',
    'Content Writing',
    'Social Media Management',
    'Digital Marketing',
    'YouTube Creator',
    'Online Teaching',
    'Photography',
    'Web Development',
    'App Development',
    'Affiliate Marketing',
    'Online Store',
    'Dropshipping',
    'Reselling Products',
    'Local Shop',
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
    'UX Design',
    'Logo Design',
    'Copywriting',
    'Email Marketing',
    'E-commerce',
    'Print on Demand',
    'Handmade Products',
    'Food Business',
    'Agriculture',
    'Livestock Farming',
    'Fish Farming',
    'Plant Nursery',
    'Repair Services',
    'Mobile Repair',
    'Computer Repair',
    'Event Planning',
    'Travel Services',
    'Taxi Service',
    'Delivery Service',
    'Car Wash',
    'Cleaning Service',
    'Beauty Service',
    'Barber Shop',
    'Fitness Coaching',
    'Yoga Teaching',
    'Music Teaching',
    'Dance Teaching',
    'Online Courses',
    'E-books',
    'Templates Selling',
    'Digital Art',
    'Stock Photos',
    'Stock Videos',
    'Website Flipping',
    'Domain Selling',
    'IT Services',
    'Cybersecurity',
    'Accounting Services',
    'Bookkeeping',
    'Tax Services',
    'Business Consulting',
    'Market Research',
    'Sales',
    'Direct Selling',
    'Network Marketing',
    'Distribution Business',
    'Wholesale Business',
    'Retail Business',
    'Grocery Store',
    'Clothing Store',
    'Shoes Store',
    'Electronics Store',
    'Furniture Store',
    'Marketplace Seller',
    'Second-hand Business',
    'Home Business',
    'Candle Making',
    'Soap Making',
    'Craft Business',
    'Jewelry Making',
    'Baking Business',
    'Meal Preparation',
    'Catering',
    'Organic Products',
    'Freelance Consulting',
    'Remote Work',
    'Part-time Work',
    'Skill-based Services',
    'Build Your Own App',
    'Online Community',
    'Social Media Affiliate',
    'Local Product Export',
    'Digital Product Selling',
  ];

  void go(String newPage) {
    setState(() {
      page = newPage;
    });
  }

  void openProduct(Product product) {
    selectedProduct = product;
    go('Detail');
  }

  void openLesson(String title) {
    lessonTitle = title;
    go('Lesson');
  }

  void back() {
    if (page == 'Detail') {
      go('Sales');
    } else if (page == 'Sell') {
      go('Sales');
    } else if (page == 'Checkout') {
      go('Cart');
    } else {
      go('Home');
    }
  }

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
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

  double get totalPrice {
    return cart.fold(0, (sum, item) => sum + item.price);
  }

  void publishProduct() {
    if (nameController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter product name and price')),
      );
      return;
    }

    final price = double.tryParse(priceController.text.trim());
    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid price')),
      );
      return;
    }

    final product = Product(
      name: nameController.text.trim(),
      category: sellCategory,
      price: price,
      image: selectedImage?.path ?? '',
      description: descriptionController.text.trim(),
      condition: sellCondition,
      country: countryController.text.trim(),
    );

    setState(() {
      products.insert(0, product);
      myListings.insert(0, product);
      nameController.clear();
      priceController.clear();
      descriptionController.clear();
      countryController.clear();
      selectedImage = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product published successfully')),
    );
    go('My Listings');
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final picked = await imagePicker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (picked != null && mounted) {
        setState(() {
          selectedImage = File(picked.path);
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image error: $e')),
      );
    }
  }

  Widget productImage(Product product, {double height = 150}) {
    if (product.image.isNotEmpty) {
      final file = File(product.image);
      if (file.existsSync()) {
        return Image.file(
          file,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }
    }

    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue.shade50,
      child: const Icon(
        Icons.shopping_bag_outlined,
        size: 65,
        color: Colors.blue,
      ),
    );
  }

  Widget mainCard(String title, IconData icon, VoidCallback action) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFF1877F2), Color(0xFF123B70)],
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YOUR WORLD. ONE PLATFORM.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'One platform, many possibilities',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 15),
              Text(
                'Created by Ramu Ban',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        mainCard('Buy & Sell Products', Icons.store, () => go('Sales')),
        mainCard('Jobs & Opportunities', Icons.work, () => go('Jobs')),
        mainCard('Learning & Income Academy', Icons.school, () => go('Learning')),
        mainCard('My Wishlist', Icons.favorite, () => go('Wishlist')),
        mainCard('My Listings', Icons.sell, () => go('My Listings')),
        mainCard('My Orders', Icons.receipt_long, () => go('Orders')),
        mainCard('My Profile', Icons.person, () => go('Profile')),
      ],
    );
  }

  Widget buildSales() {
    final filtered = products.where((product) {
      final matchesCategory =
          selectedCategory == 'All' || product.category == selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      return matchesCategory && matchesSearch;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: searchController,
            onChanged: (value) => setState(() => searchText = value),
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (_) => setState(() {
                    selectedCategory = category;
                  }),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? const Center(child: Text('No products found'))
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: filtered.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = filtered[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => openProduct(product),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: productImage(product)),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Rs ${product.price.toStringAsFixed(0)}'),
                                  Text(
                                    product.category,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          wishlist.contains(product)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        onPressed: () =>
                                            toggleWishlist(product),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_shopping_cart,
                                          size: 20,
                                        ),
                                        onPressed: () => addToCart(product),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget buildProductDetail() {
    final product = selectedProduct;
    if (product == null) {
      return const Center(child: Text('Product not found'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: productImage(product, height: 250),
        ),
        const SizedBox(height: 15),
        Text(
          product.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Rs ${product.price.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text('Category: ${product.category}'),
        Text('Condition: ${product.condition}'),
        if (product.country.isNotEmpty) Text('Location: ${product.country}'),
        const SizedBox(height: 15),
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(product.description.isEmpty ? 'No description' : product.description),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => addToCart(product),
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Add to Cart'),
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
          'Sell Your Product',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
        TextField(
          controller: priceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Price (Rs)',
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
          items: categories.where((c) => c != 'All').map((c) {
            return DropdownMenuItem(value: c, child: Text(c));
          }).toList(),
          onChanged: (value) {
            if (value != null) setState(() => sellCategory = value);
          },
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: sellCondition,
          decoration: const InputDecoration(
            labelText: 'Condition',
            border: OutlineInputBorder(),
          ),
          items: ['New', 'Used'].map((c) {
            return DropdownMenuItem(value: c, child: Text(c));
          }).toList(),
          onChanged: (value) {
            if (value != null) setState(() => sellCondition = value);
          },
        ),
        const SizedBox(height: 12),
        TextField(
          controller: countryController,
          decoration: const InputDecoration(
            labelText: 'Location / Country',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: descriptionController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Product Description',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: selectedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(selectedImage!, fit: BoxFit.cover),
                )
              : const Center(
                  child: Icon(Icons.image, size: 65, color: Colors.blue),
                ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: publishProduct,
          icon: const Icon(Icons.publish),
          label: const Text('Publish Product'),
        ),
      ],
    );
  }

  Widget buildCart() {
    return cart.isEmpty
        ? const Center(child: Text('Your cart is empty'))
        : ListView(
            padding: const EdgeInsets.all(12),
            children: [
              ...cart.map((product) {
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      child: productImage(product, height: 60),
                    ),
                    title: Text(product.name),
                    subtitle: Text('Rs ${product.price.toStringAsFixed(0)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => setState(() {
                        cart.remove(product);
                      }),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 15),
              Text(
                'Total: Rs ${totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => go('Checkout'),
                child: const Text('Proceed to Checkout'),
              ),
            ],
          );
  }

  Widget buildCheckout() {
    return CheckoutPage(
      total: totalPrice,
      onConfirm: () {
        setState(() {
          orders.addAll(cart);
          cart.clear();
        });
        go('Orders');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Demo order placed')),
        );
      },
    );
  }

  Widget buildJobs() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text(
          'Jobs & Opportunities',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...jobTopics.map((topic) => mainCard(
              topic,
              Icons.school,
              () => openLesson(topic),
            )),
      ],
    );
  }

  String lessonContent(String topic) {
    if (topic == '100 Income Ideas') {
      return incomeIdeas.asMap().entries.map((e) {
        return '${e.key + 1}. ${e.value}';
      }).join('\n');
    }

    if (topic == 'Network Marketing') {
      return '''
NETWORK MARKETING LEARNING

1. Learn the company's products first.
2. Understand the business model and all costs.
3. Check the company's registration and policies.
4. Never promise guaranteed income.
5. Avoid buying excessive inventory.
6. Focus on real product customers.
7. Keep records of sales and expenses.
8. Respect customers and their decisions.
9. Understand compensation plans carefully.
10. Build communication and leadership skills.

How to begin:
Research a company, learn its product, check costs and policies, start small, and evaluate actual profit—not just recruitment rewards.
''';
    }

    if (topic == 'Share Market Knowledge') {
      return '''
SHARE MARKET BASIC LEARNING

1. Learn what shares are.
2. Understand stock exchanges.
3. Learn risk and return.
4. Understand long-term investing.
5. Learn diversification.
6. Study company financial statements.
7. Learn about index funds.
8. Understand trading vs investing.
9. Avoid borrowing to invest.
10. Do not trust guaranteed-return claims.

Start with education and paper practice. Do not invest money you cannot afford to lose.
''';
    }

    if (topic == 'Digital Marketing') {
      return '''
DIGITAL MARKETING LEARNING

1. Understand your target audience.
2. Learn social media platforms.
3. Content creation basics.
4. Copywriting.
5. Search engine optimization.
6. Paid ads basics.
7. Email marketing.
8. Analytics and measurement.
9. Brand building.
10. Practice with a small project.

How to succeed:
Practice consistently, measure results, build a portfolio, learn from campaigns, and offer services only when you can deliver.
''';
    }

    return '''
${topic.toUpperCase()}

Learn the basics, build practical skills, and practice with small projects.

Getting started:
1. Understand the field.
2. Learn the basic skills.
3. Practice regularly.
4. Create sample work.
5. Build a portfolio.
6. Find legitimate opportunities.
7. Improve communication.
8. Avoid scams and upfront-fee job offers.
9. Track progress.
10. Keep learning.
''';
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
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }

  Widget buildLearning() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text(
          'Learning & Income Academy',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...jobTopics.map((topic) => mainCard(
              topic,
              Icons.menu_book,
              () => openLesson(topic),
            )),
      ],
    );
  }

  Widget buildProfile() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 45,
          child: Icon(Icons.person, size: 45),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Across Access User',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        mainCard('My Listings', Icons.sell, () => go('My Listings')),
        mainCard('My Wishlist', Icons.favorite, () => go('Wishlist')),
        mainCard('My Orders', Icons.receipt, () => go('Orders')),
      ],
    );
  }

  Widget buildSimpleList(List<Product> items, String emptyText) {
    if (items.isEmpty) return Center(child: Text(emptyText));

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final product = items[index];
        return Card(
          child: ListTile(
            leading: SizedBox(
              width: 55,
              child: productImage(product, height: 55),
            ),
            title: Text(product.name),
            subtitle: Text('Rs ${product.price.toStringAsFixed(0)}'),
            onTap: () => openProduct(product),
            trailing: page == 'My Listings'
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => setState(() {
                      myListings.remove(product);
                      products.remove(product);
                    }),
                  )
                : null,
          ),
        );
      },
    );
  }

  String get pageTitle {
    switch (page) {
      case 'Detail':
        return 'Product Details';
      case 'Sell':
        return 'Sell Product';
      case 'Checkout':
        return 'Checkout';
      case 'Lesson':
        return lessonTitle;
      case 'Wishlist':
        return 'My Wishlist';
      case 'My Listings':
        return 'My Listings';
      case 'Orders':
        return 'My Orders';
      case 'Learning':
        return 'Learning Academy';
      case 'Profile':
        return 'Profile';
      case 'Cart':
        return 'My Cart';
      case 'Jobs':
        return 'Jobs & Opportunities';
      case 'Sales':
        return 'Buy & Sell';
      default:
        return 'Across Access';
    }
  }

  Widget get pageBody {
    switch (page) {
      case 'Sales':
        return buildSales();
      case 'Detail':
        return buildProductDetail();
      case 'Sell':
        return buildSellPage();
      case 'Cart':
        return buildCart();
      case 'Checkout':
        return buildCheckout();
      case 'Jobs':
        return buildJobs();
      case 'Lesson':
        return buildLesson();
      case 'Learning':
        return buildLearning();
      case 'Profile':
        return buildProfile();
      case 'Wishlist':
        return buildSimpleList(wishlist, 'Wishlist is empty');
      case 'My Listings':
        return buildSimpleList(myListings, 'You have no listings');
      case 'Orders':
        return buildSimpleList(orders, 'No orders yet');
      default:
        return buildHome();
    }
  }

  bool get showBottomNav {
    return ['Home', 'Sales', 'Jobs', 'Learning', 'Profile'].contains(page);
  }

  int get currentNavIndex {
    switch (page) {
      case 'Sales':
        return 1;
      case 'Jobs':
        return 2;
      case 'Learning':
        return 3;
      case 'Profile':
        return 4;
      default:
        return 0;
    }
  }

  void onNavTap(int index) {
    const pages = ['Home', 'Sales', 'Jobs', 'Learning', 'Profile'];
    go(pages[index]);
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: page == 'Home',
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) back();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          leading: page == 'Home'
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: back,
                ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () => go('Cart'),
            ),
          ],
        ),
        body: pageBody,
        floatingActionButton: page == 'Sales'
            ? FloatingActionButton.extended(
                onPressed: () => go('Sell'),
                icon: const Icon(Icons.add),
                label: const Text('Sell Product'),
              )
            : null,
        bottomNavigationBar: showBottomNav
            ? NavigationBar(
                selectedIndex: currentNavIndex,
                onDestinationSelected: onNavTap,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.store),
                    label: 'Sales',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.work),
                    label: 'Jobs',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.school),
                    label: 'Learn',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              )
            : null,
      ),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final double total;
  final VoidCallback onConfirm;

  const CheckoutPage({
    super.key,
    required this.total,
    required this.onConfirm,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentMethod = 'Cash on Delivery (Demo)';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Checkout',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Text(
          'Total Amount: Rs ${widget.total.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: paymentMethod,
          decoration: const InputDecoration(
            labelText: 'Payment Method',
            border: OutlineInputBorder(),
          ),
          items: [
            'Cash on Delivery (Demo)',
            'UPI / Wallet (Demo)',
            'Card Payment (Demo)',
          ].map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(method),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => paymentMethod = value);
            }
          },
        ),
        const SizedBox(height: 15),
        const Text(
          'Demo checkout only. No real payment is processed.',
          style: TextStyle(color: Colors.orange),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: widget.onConfirm,
          child: const Text('Confirm Demo Order'),
        ),
      ],
    );
  }
}
