#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script để cập nhật thuật ngữ tiếng Nhật theo khuyến nghị của hội đồng AI.

Thay đổi:
1. 浄好 → 美心所 (Sobhana)
2. 戒部分 → 離心所 (Viratiyo)
3. 果報 → 異熟 (Vipāka) - chỉ trong ngữ cảnh vipāka citta
4. Thêm chú giải cho các thuật ngữ quan trọng
"""

import re
import json
from pathlib import Path

def update_ja_content():
    """Cập nhật file content_ja.json"""
    
    content_path = Path('assets/content/content_ja.json')
    
    with open(content_path, 'r', encoding='utf-8') as f:
        content = json.load(f)
    
    changes = []
    
    # Duyệt qua tất cả study modules
    for module_id, module in content.get('studyModules', {}).items():
        # Cập nhật lesson sections
        for section in module.get('lessonSections', []):
            # Thay đổi trong title, summary, body
            for field in ['title', 'summary']:
                if field in section:
                    old = section[field]
                    new = replace_terms(old, module_id, section.get('id', ''))
                    if old != new:
                        section[field] = new
                        changes.append(f"{module_id}/{section.get('id', '')}/{field}: {old[:50]} → {new[:50]}")
            
            if 'body' in section and isinstance(section['body'], list):
                for i, para in enumerate(section['body']):
                    old = para
                    new = replace_terms(para, module_id, section.get('id', ''))
                    if old != new:
                        section['body'][i] = new
                        changes.append(f"{module_id}/{section.get('id', '')}/body[{i}]: {old[:50]} → {new[:50]}")
            
            # Cập nhật keyTerms
            for term in section.get('keyTerms', []):
                if 'term' in term:
                    old = term['term']
                    new = replace_term_name(old, term.get('pali', ''))
                    if old != new:
                        term['term'] = new
                        changes.append(f"{module_id}/{section.get('id', '')}/keyTerm: {old} → {new}")
                
                if 'meaning' in term:
                    old = term['meaning']
                    new = replace_terms(old, module_id, section.get('id', ''))
                    if old != new:
                        term['meaning'] = new
                        changes.append(f"{module_id}/{section.get('id', '')}/keyTerm/meaning: {old[:50]} → {new[:50]}")
        
        # Cập nhật review cards
        for card in module.get('reviewCards', []):
            for field in ['front', 'back']:
                if field in card:
                    old = card[field]
                    new = replace_terms(old, module_id, card.get('id', ''))
                    if old != new:
                        card[field] = new
                        changes.append(f"{module_id}/{card.get('id', '')}/{field}: {old[:50]} → {new[:50]}")
        
        # Cập nhật quiz seeds
        for quiz in module.get('quizSeeds', []):
            for field in ['question', 'explanation']:
                if field in quiz:
                    old = quiz[field]
                    new = replace_terms(old, module_id, quiz.get('id', ''))
                    if old != new:
                        quiz[field] = new
                        changes.append(f"{module_id}/{quiz.get('id', '')}/{field}: {old[:50]} → {new[:50]}")
    
    # Lưu file
    with open(content_path, 'w', encoding='utf-8') as f:
        json.dump(content, f, ensure_ascii=False, indent=2)
    
    return changes

def replace_terms(text, module_id, section_id):
    """Thay thế thuật ngữ trong text"""
    
    # 1. 浄好 → 美心所 (Sobhana)
    text = text.replace('浄好', '美心所')
    
    # 2. 戒部分 → 離心所 (Viratiyo)
    text = text.replace('戒部分', '離心所')
    
    # 3. 果報 → 異熟 (chỉ trong ngữ cảnh vipāka)
    # Thay thế có chọn lọc dựa trên ngữ cảnh
    if 'vipāka' in text.lower() or 'Vipāka' in text or '果心' in text or '異熟' not in text:
        # Trong ngữ cảnh vipāka citta
        text = re.sub(r'果報心', '異熟心', text)
        text = re.sub(r'果報\(', '異熟(', text)
        
        # Trong các thuật ngữ cụ thể
        text = re.sub(r'不善果無因', '不善異熟無因', text)
        text = re.sub(r'善果無因', '善異熟無因', text)
        text = re.sub(r'大果心', '大異熟心', text)
        
        # Trong mô tả chung về vipāka
        if '果報' in text and ('心' in text or 'citta' in text.lower()):
            text = re.sub(r'果報', '異熟', text)
    
    return text

def replace_term_name(term_name, pali):
    """Thay đổi tên thuật ngữ dựa trên Pāli"""
    
    # Sobhana
    if pali and 'sobhana' in pali.lower():
        if term_name == '浄好':
            return '美心所'
    
    # Viratiyo
    if pali and 'virati' in pali.lower():
        if term_name == '戒部分':
            return '離心所'
    
    # Vipāka
    if pali and 'vipāka' in pali.lower():
        if '果報' in term_name:
            return term_name.replace('果報', '異熟')
    
    return term_name

def update_proposal_files():
    """Cập nhật các file proposal"""
    
    proposal_files = list(Path('l10n_work').glob('ja_m*_proposal.py'))
    
    for file_path in proposal_files:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Thay thế thuật ngữ
        new_content = replace_terms(content, file_path.stem, '')
        
        # Thay thế tên thuật ngữ
        new_content = new_content.replace('"term": "浄好"', '"term": "美心所"')
        new_content = new_content.replace('"term": "戒部分"', '"term": "離心所"')
        
        # Thay thế trong meaning
        new_content = re.sub(r'果報心', '異熟心', new_content)
        new_content = re.sub(r'不善果無因', '不善異熟無因', new_content)
        new_content = re.sub(r'善果無因', '善異熟無因', new_content)
        new_content = re.sub(r'大果心', '大異熟心', new_content)
        
        if content != new_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated: {file_path}")

if __name__ == '__main__':
    print("Đang cập nhật thuật ngữ tiếng Nhật...")
    
    # Cập nhật proposal files
    update_proposal_files()
    
    # Cập nhật content_ja.json
    changes = update_ja_content()
    
    print(f"\nHoàn thành! Đã thực hiện {len(changes)} thay đổi.")
    
    if changes:
        print("\nCác thay đổi chính:")
        for change in changes[:20]:  # Hiển thị 20 thay đổi đầu tiên
            print(f"  - {change}")
        if len(changes) > 20:
            print(f"  ... và {len(changes) - 20} thay đổi khác")
