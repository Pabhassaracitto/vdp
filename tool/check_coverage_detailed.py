#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Kiểm tra coverage chi tiết theo slot ID.

Phân tích:
- Slot nào có trong nguồn nhưng không có trong đích
- Slot nào có trong đích nhưng không có trong nguồn
- Slot nào bị trùng
- Số lượng đoạn văn trong từng slot
"""

import json
import sys
from pathlib import Path
from collections import defaultdict

def count_slots(data, prefix=''):
    """Đếm slot trong data structure"""
    slots = {}
    
    if isinstance(data, dict):
        for key, value in data.items():
            full_key = f"{prefix}.{key}" if prefix else key
            
            if isinstance(value, dict):
                # Nếu là dict, đệ quy
                sub_slots = count_slots(value, full_key)
                slots.update(sub_slots)
            elif isinstance(value, list):
                # Nếu là list, đánh dấu là list
                slots[full_key] = f"list({len(value)})"
            else:
                # Primitive value
                slots[full_key] = str(value)[:50]
    
    return slots

def compare_slots(source_slots, target_slots):
    """So sánh slot giữa nguồn và đích"""
    source_keys = set(source_slots.keys())
    target_keys = set(target_slots.keys())
    
    only_in_source = source_keys - target_keys
    only_in_target = target_keys - source_keys
    common = source_keys & target_keys
    
    return {
        'only_in_source': sorted(only_in_source),
        'only_in_target': sorted(only_in_target),
        'common': sorted(common),
        'source_count': len(source_keys),
        'target_count': len(target_keys),
        'coverage': len(common) / len(source_keys) * 100 if source_keys else 0
    }

def analyze_study_modules(source, target):
    """Phân tích study modules chi tiết"""
    print("=" * 80)
    print("PHÂN TÍCH STUDY MODULES")
    print("=" * 80)
    
    source_modules = source.get('studyModules', {})
    target_modules = target.get('studyModules', {})
    
    results = []
    
    for module_id in sorted(set(source_modules.keys()) | set(target_modules.keys())):
        source_mod = source_modules.get(module_id, {})
        target_mod = target_modules.get(module_id, {})
        
        # So sánh sections
        source_sections = len(source_mod.get('lessonSections', []))
        target_sections = len(target_mod.get('lessonSections', []))
        
        # So sánh cards
        source_cards = len(source_mod.get('reviewCards', []))
        target_cards = len(target_mod.get('reviewCards', []))
        
        # So sánh quizzes
        source_quizzes = len(source_mod.get('quizSeeds', []))
        target_quizzes = len(target_mod.get('quizSeeds', []))
        
        results.append({
            'module': module_id,
            'source_sections': source_sections,
            'target_sections': target_sections,
            'source_cards': source_cards,
            'target_cards': target_cards,
            'source_quizzes': source_quizzes,
            'target_quizzes': target_quizzes,
        })
    
    # In kết quả
    print(f"\n{'Module':<30} {'Sections':<15} {'Cards':<15} {'Quizzes':<15}")
    print("-" * 80)
    
    for r in results:
        print(f"{r['module']:<30} "
              f"{r['target_sections']:>3}/{r['source_sections']:<3} "
              f"{'✅' if r['target_sections'] == r['source_sections'] else '❌'}"
              f"{'':<8} "
              f"{r['target_cards']:>3}/{r['source_cards']:<3} "
              f"{'✅' if r['target_cards'] == r['source_cards'] else '❌'}"
              f"{'':<8} "
              f"{r['target_quizzes']:>3}/{r['source_quizzes']:<3} "
              f"{'✅' if r['target_quizzes'] == r['source_quizzes'] else '❌'}")
    
    return results

def analyze_paragraph_counts(source, target, module_id):
    """Phân tích số đoạn trong từng section"""
    print(f"\n{'=' * 80}")
    print(f"PHÂN TÍCH ĐOẠN VĂN: {module_id}")
    print("=" * 80)
    
    source_mod = source.get('studyModules', {}).get(module_id, {})
    target_mod = target.get('studyModules', {}).get(module_id, {})
    
    source_sections = source_mod.get('lessonSections', [])
    target_sections = target_mod.get('lessonSections', [])
    
    for i, (source_sec, target_sec) in enumerate(zip(source_sections, target_sections)):
        source_paras = len(source_sec.get('body', []))
        target_paras = len(target_sec.get('body', []))
        
        status = '✅' if target_paras == source_paras else '⚠️'
        
        print(f"\n{status} Section {i+1}: {source_sec.get('id', 'N/A')}")
        print(f"  Nguồn: {source_paras} đoạn")
        print(f"  Đích:  {target_paras} đoạn")
        
        if target_paras != source_paras:
            print(f"  Chênh lệch: {target_paras - source_paras:+d} đoạn")

def main():
    # Load dữ liệu
    source_path = Path('assets/content/content_vi.json')
    target_path = Path('assets/content/content_ja.json')
    
    if not source_path.exists():
        print(f"❌ Không tìm thấy file nguồn: {source_path}")
        sys.exit(1)
    
    if not target_path.exists():
        print(f"❌ Không tìm thấy file đích: {target_path}")
        sys.exit(1)
    
    with open(source_path, 'r', encoding='utf-8') as f:
        source = json.load(f)
    
    with open(target_path, 'r', encoding='utf-8') as f:
        target = json.load(f)
    
    # Phân tích study modules
    results = analyze_study_modules(source, target)
    
    # Phân tích chi tiết các module có chênh lệch
    modules_to_check = ['M5_SOBHANA', 'M12_VO_NHAN']
    
    for module_id in modules_to_check:
        analyze_paragraph_counts(source, target, module_id)
    
    # Tổng kết
    print(f"\n{'=' * 80}")
    print("TỔNG KẾT")
    print("=" * 80)
    
    total_source = sum(r['source_sections'] + r['source_cards'] + r['source_quizzes'] for r in results)
    total_target = sum(r['target_sections'] + r['target_cards'] + r['target_quizzes'] for r in results)
    
    print(f"\nTổng slot nguồn: {total_source}")
    print(f"Tổng slot đích: {total_target}")
    print(f"Tỷ lệ coverage: {total_target / total_source * 100:.1f}%")
    
    # Kiểm tra các trường hợp đặc biệt
    print("\n" + "=" * 80)
    print("CÁC TRƯỜNG HỢP ĐẶC BIỆT")
    print("=" * 80)
    
    # Module có nhiều đoạn hơn nguồn
    for module_id in ['M4_AKUSALA', 'M5_SOBHANA', 'M12_VO_NHAN', 'M13_SAC_GIOI']:
        source_mod = source.get('studyModules', {}).get(module_id, {})
        target_mod = target.get('studyModules', {}).get(module_id, {})
        
        source_total = sum(len(s.get('body', [])) for s in source_mod.get('lessonSections', []))
        target_total = sum(len(s.get('body', [])) for s in target_mod.get('lessonSections', []))
        
        if target_total > source_total:
            print(f"\n⚠️  {module_id}: {target_total}/{source_total} đoạn (nhiều hơn {target_total - source_total})")
            print(f"   Cần rà soát để xác định:")
            print(f"   - Đoạn bổ sung hợp lý (giải thích rõ hơn)")
            print(f"   - Đoạn trùng lặp")
            print(f"   - Đoạn không cần thiết")

if __name__ == '__main__':
    main()
