import 'package:flutter/material.dart';
import '../../../../data/models/paticca_model.dart';

class PaticcaDetailSheet extends StatelessWidget {
  final PaticcaModel item;
  const PaticcaDetailSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item.namePali} (${item.nameVietnamese})', 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('Chi tiết Nhân Duyên:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...item.links.isEmpty
                ? [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Đây là chi quả cuối của vòng Nhân Duyên kiếp này. Không khởi sanh điều kiện mới.'),
                    )
                  ]
                : item.links.map((link) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('• Duyên sang: ${link.effectId}\n  Giải thích: ${link.explanation}'),
                  )),
          ],
        ),
      ),
    );
  }
}
