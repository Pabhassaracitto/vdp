#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Merge Japanese translation proposal into content_ja.json.

This script reads the translation proposal from l10n_work/ja_translation_proposal.py
and merges the extended fields (characteristic, function, manifestation, etc.) into
assets/content/content_ja.json.

Run this AFTER build_full_catalogs.py to add the extended fields.
"""

import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
CONTENT_JA = os.path.join(ROOT, "assets", "content", "content_ja.json")
PROPOSAL = os.path.join(ROOT, "l10n_work", "ja_translation_proposal.py")

def load_proposal():
    """Load the proposal data structures."""
    with open(PROPOSAL, encoding="utf-8") as f:
        code = f.read()
    
    # Execute the proposal code to get the data structures
    namespace = {}
    exec(code, namespace)
    
    return {
        "paticcas": namespace["PATICCAS_JA"],
        "paccayas": namespace["PACCAYAS_JA"],
        "vithis": namespace["VITHIS_JA"],
        "cetasikas": namespace["CETASIKAS_JA_ASPECTS"],
        "rupas": namespace["RUPAS_JA_ASPECTS"],
        "kammas": namespace["KAMMAS_JA_DETAIL"],
    }

def merge_paticcas(content, proposal):
    """Merge paticcas extended fields."""
    count = 0
    for pid, fields in proposal["paticcas"].items():
        if pid in content["paticcas"]:
            for field, value in fields.items():
                if value is not None:
                    content["paticcas"][pid][field] = value
                    count += 1
    return count

def merge_paccayas(content, proposal):
    """Merge paccayas extended fields."""
    count = 0
    for pid, fields in proposal["paccayas"].items():
        if pid in content["paccayas"]:
            for field, value in fields.items():
                if value is not None:
                    content["paccayas"][pid][field] = value
                    count += 1
    return count

def merge_vithis(content, proposal):
    """Merge vithis extended fields."""
    count = 0
    for vid, fields in proposal["vithis"].items():
        if vid in content["vithis"]:
            # Merge top-level fields
            for field in ["arisingCondition", "significance", "doctrinalNote"]:
                if field in fields and fields[field] is not None:
                    content["vithis"][vid][field] = fields[field]
                    count += 1
            
            # Merge steps
            if "steps" in fields:
                # Convert steps list to dict keyed by stepNumber string
                existing_steps = content["vithis"][vid].get("steps", {})
                for step_data in fields["steps"]:
                    step_num = str(step_data["stepNumber"])
                    step_entry = {}
                    
                    # Add name if present
                    if "name" in step_data:
                        step_entry["name"] = step_data["name"]
                    
                    # Add description if present
                    if "description" in step_data:
                        step_entry["description"] = step_data["description"]
                    
                    # Add doctrinalNote if present
                    if "doctrinalNote" in step_data:
                        step_entry["doctrinalNote"] = step_data["doctrinalNote"]
                    
                    # Merge with existing step data
                    if step_num in existing_steps:
                        existing_steps[step_num].update(step_entry)
                    else:
                        existing_steps[step_num] = step_entry
                    
                    count += 1
                
                content["vithis"][vid]["steps"] = existing_steps
    
    return count

def merge_cetasikas(content, proposal):
    """Merge cetasikas extended fields."""
    count = 0
    for cid, fields in proposal["cetasikas"].items():
        if fields is None:
            continue  # Unverified, skip
        if cid in content["cetasikas"]:
            for field, value in fields.items():
                if value is not None:
                    content["cetasikas"][cid][field] = value
                    count += 1
    return count

def merge_rupas(content, proposal):
    """Merge rupas extended fields."""
    count = 0
    for rid, fields in proposal["rupas"].items():
        if rid in content["rupas"]:
            for field, value in fields.items():
                if value is not None:
                    content["rupas"][rid][field] = value
                    count += 1
    return count

def merge_kammas(content, proposal):
    """Merge kammas extended fields."""
    count = 0
    for kid, fields in proposal["kammas"].items():
        if kid in content["kammas"]:
            for field, value in fields.items():
                if value is not None:
                    content["kammas"][kid][field] = value
                    count += 1
    return count

def main():
    print(f"Loading proposal from {PROPOSAL}")
    proposal = load_proposal()
    
    print(f"Loading content from {CONTENT_JA}")
    with open(CONTENT_JA, encoding="utf-8") as f:
        content = json.load(f)
    
    print("Merging extended fields...")
    total = 0
    total += merge_paticcas(content, proposal)
    total += merge_paccayas(content, proposal)
    total += merge_vithis(content, proposal)
    total += merge_cetasikas(content, proposal)
    total += merge_rupas(content, proposal)
    total += merge_kammas(content, proposal)
    
    print(f"Merged {total} fields")
    
    print(f"Writing back to {CONTENT_JA}")
    with open(CONTENT_JA, "w", encoding="utf-8") as f:
        json.dump(content, f, ensure_ascii=False, indent=2)
        f.write("\n")
    
    print("Done!")

if __name__ == "__main__":
    main()
