#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script để thêm sourceRefs từ Vietnamese sang Japanese.

SourceRefs là tham chiếu PDF nguồn, không quan trọng cho việc học nhưng
cần thiết để web hiển thị 100% tiếng Nhật (không fallback về tiếng Anh).
"""

import json
from pathlib import Path

def add_source_refs():
    """Thêm sourceRefs từ Vietnamese sang Japanese"""
    
    # Load Vietnamese content
    vi_path = Path('assets/content/content_vi.json')
    with open(vi_path, 'r', encoding='utf-8') as f:
        vi = json.load(f)
    
    # Load Japanese content
    ja_path = Path('assets/content/content_ja.json')
    with open(ja_path, 'r', encoding='utf-8') as f:
        ja = json.load(f)
    
    # Track changes
    changes = []
    
    # Copy sourceRefs from Vietnamese to Japanese
    for mid in vi['studyModules'].keys():
        vi_mod = vi['studyModules'][mid]
        ja_mod = ja.get('studyModules', {}).get(mid, {})
        
        if not ja_mod:
            print(f"❌ {mid}: Missing in Japanese")
            continue
        
        # Copy sourceRefs for lessonSections
        if 'lessonSections' in vi_mod and 'lessonSections' in ja_mod:
            for i, (vi_section, ja_section) in enumerate(zip(vi_mod['lessonSections'], ja_mod['lessonSections'])):
                if 'sourceRefs' in vi_section and 'sourceRefs' not in ja_section:
                    ja_section['sourceRefs'] = vi_section['sourceRefs']
                    changes.append(f"{mid}/lessonSections[{i}]: Added sourceRefs")
        
        # Copy sourceRefs for reviewCards (if present in VI)
        if 'reviewCards' in vi_mod and 'reviewCards' in ja_mod:
            for i, (vi_card, ja_card) in enumerate(zip(vi_mod['reviewCards'], ja_mod['reviewCards'])):
                if 'sourceRefs' in vi_card and 'sourceRefs' not in ja_card:
                    ja_card['sourceRefs'] = vi_card['sourceRefs']
                    changes.append(f"{mid}/reviewCards[{i}]: Added sourceRefs")
        
        # Copy sourceRefs for quizSeeds (if present in VI)
        if 'quizSeeds' in vi_mod and 'quizSeeds' in ja_mod:
            for i, (vi_quiz, ja_quiz) in enumerate(zip(vi_mod['quizSeeds'], ja_mod['quizSeeds'])):
                if 'sourceRefs' in vi_quiz and 'sourceRefs' not in ja_quiz:
                    ja_quiz['sourceRefs'] = vi_quiz['sourceRefs']
                    changes.append(f"{mid}/quizSeeds[{i}]: Added sourceRefs")
    
    # Save Japanese content
    with open(ja_path, 'w', encoding='utf-8') as f:
        json.dump(ja, f, ensure_ascii=False, indent=2)
        f.write('\n')
    
    print(f"\n✅ Added {len(changes)} sourceRefs entries")
    
    if changes:
        print("\nChanges:")
        for change in changes[:20]:  # Show first 20
            print(f"  - {change}")
        if len(changes) > 20:
            print(f"  ... and {len(changes) - 20} more changes")

if __name__ == '__main__':
    print("Adding sourceRefs from Vietnamese to Japanese...")
    add_source_refs()
