import 'package:flutter/material.dart';

class CategoryFilterWidget extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const CategoryFilterWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Semua', 'icon': Icons.menu_book},
      {'name': 'Legenda', 'icon': Icons.castle},
      {'name': 'Dongeng', 'icon': Icons.auto_awesome},
      {'name': 'Fabel', 'icon': Icons.pets},
      {'name': 'Mitos', 'icon': Icons.psychology_alt},
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.category,
                  color: Color(0xFF8D4E36),
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Kategori Cerita',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5D4037),
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final categoryName = category['name'] as String;
                final categoryIcon = category['icon'] as IconData;
                final isSelected = categoryName == selectedCategory;

                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => onCategoryChanged(categoryName),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                          colors: [
                            Color(0xFF8D4E36),
                            Color(0xFFB7926C),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                            : null,
                        color: isSelected ? null : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Color(0xFF8D4E36).withOpacity(0.4),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? Color(0xFF8D4E36).withOpacity(0.25)
                                : Colors.grey.withOpacity(0.08),
                            blurRadius: isSelected ? 4 : 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            categoryIcon,
                            color: isSelected
                                ? Colors.white
                                : Color(0xFF8D4E36),
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : Color(0xFF5D4037),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Active indicator
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFF8D4E36),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Dipilih: $selectedCategory',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8D4E36).withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Alternative simple version with enhanced styling
class SimpleCategoryFilterWidget extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const SimpleCategoryFilterWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', 'Legenda', 'Dongeng', 'Fabel', 'Mitos'];

    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => onCategoryChanged(category),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                    colors: [Color(0xFF8D4E36), Color(0xFFB7926C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                      : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Color(0xFF8D4E36).withOpacity(0.4),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? Color(0xFF8D4E36).withOpacity(0.3)
                          : Colors.grey.withOpacity(0.1),
                      blurRadius: isSelected ? 6 : 3,
                      offset: Offset(0, isSelected ? 3 : 1),
                    ),
                  ],
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.white : Color(0xFF5D4037),
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}