# English source issues found during the si review

Status: for the project admin. These are issues in `assets/content/content_en.json` (English). The si translation was not changed to fix them. Each item lists what was checked, so the admin can decide the English wording.

Sources used (secondary or English-language, not the Sinhala primary text): Ven. Nārada, *A Manual of Abhidhamma* (ch.3, ch.5, ch.6); Abhidhammattha Saṅgaha ch.6 (palikanon.com); pitaka.lk Abhidharma Chandrikava 5-9, 9-12, 9-15 (Sinhala, edition not confirmed); SN 12.63; Visuddhimagga XVII (quoted secondarily).

## Errors (English should change)

1. **KM_R_04 (Supramundane kamma / Path kamma), doctrinalNote**
   - English: "Supramundane kamma does not produce rebirth within the three realms; it produces Nibbāna as its result."
   - Problem: Nārada ch.5 says supramundane consciousness is not regarded as kamma or vipāka. The result of a path is the fruition consciousness (phala citta), not Nibbāna.
   - Suggested action: rewrite the result as "fruition consciousness (phala)". Check the name "Path kamma": in this classification, path consciousness is not kamma.

2. **VT_VITHIMUTTA (Vīthimutta-citta), steps**
   - English lists three steps: rebirth-linking, life-continuum, death consciousness.
   - Chandrikava 5-9 says bhavaṅga, bhavaṅga-calana and bhavaṅga-upaccheda all belong to vīthimutta and are vipāka. The English omits calana and upaccheda.
   - Suggested action: add the two steps, or state in the note why they are left out.

## Claims to fix or source

3. **KM_R_01 (Unwholesome kamma), doctrinalNote**
   - English: "...belongs to the sense sphere and ripens within the woeful planes of the sense sphere."
   - Partly supported: the 12 akusala cittas are kāmāvacara. But "ripens within the woeful planes" is only one outcome of akusala kamma, so the sentence is incomplete.
   - Suggested action: rewrite to state the outcomes, or add a source for the claim.

4. **PC_02 (Object condition), doctrinalNote**
   - English: "According to Visuddhimagga XVII, ignorance serves as object condition for wholesome formations when a meditator examines ignorance with wisdom."
   - Substance matches Chandrikava 9-12 (ignorance as ārammaṇa when contemplated as decay and passing). The attribution to "Visuddhimagga XVII" is not confirmed; no chapter reference was checked.
   - Suggested action: confirm the chapter, or cite Chandrikava 9-12.

5. **PC_03 (Predominance condition), doctrinalNote**
   - English: "No predominance condition occurs among the 18 rootless cittas, nor in cittas where only one dominant is possible."
   - Standard Abhidhamma doctrine, but not in Chandrikava 9-12, which gives the four adhipati (chanda, viriya, citta, vīmaṃsā).
   - Suggested action: add a source for the 18-rootless claim.

6. **PC_12 (Repetition condition), doctrinalNote**
   - English: "A supramundane path impulsion is not repetition condition, because it arises for a single mind-moment only."
   - Consistent with standard doctrine. Chandrikava 9-15 lists only kusala, akusala and kiriya javana and does not state the exclusion.
   - Suggested action: add a source line.

7. **PD_11 (Birth), doctrinalNote**
   - English: "The three-life circle joins here: birth (PD_11) corresponds to consciousness (PD_03) on the result side of the future life."
   - Supported by Visuddhimagga XVII (secondary quotation: the five future results beginning with consciousness are called "birth"). Primary text not checked.
   - Suggested action: cite the primary chapter and paragraph.

8. **RP_022 (Lightness of matter), doctrinalNote**
   - English: "Not produced by kamma. Depends on present health and conditions."
   - Claim checked: Saṅgaha ch.6 lists the kamma-born groups without lahutā; it comes from citta, utu and āhāra. Saṅgaha §31 defines lahutā as physical health.
   - Suggested action (optional): name the three causes (citta, utu, āhāra) in the note. The English does not state them, so the si does not either.

## Not errors, but for the admin's attention

9. **Citta shortName (71 entries)**: in every one of the 71 English entries, `shortName` is identical to `name`. The field adds nothing. The admin may remove it, or give it a short form.

10. **VT_VITHIMUTTA step 1 and VT_Y_MON step 4**: the citta-number claims (CI_019/CI_026, CI_027, CI_063–CI_070) and "verbal and bodily kamma also begin at the mind door" are not checked against a source.

## Verified, no change needed

- PC_01, PC_10, PC_11 definitions match Chandrikava 9-12 and 9-15.
- PC_11 "85 cittas" (89 minus 4 arūpa-vipāka) matches the Paṭṭhāna ch.15 reference.
- RP_002 "only great element that cannot be directly sensed through bodily contact" matches Nārada ch.6 (āpo is not phoṭṭhabba).
- PC_15 SN 12.63 reference matches the sutta on the four nutriments.
- VT_Y_MON "11 mental factors" matches Nārada's determining consciousness (7 universals + vitakka, vicāra, adhimokkha, vīriya).
- VT_Y_MON "begins with mind-door adverting (CI_029), without five-door adverting" matches Chandrikava 5-9.

## Batch 3 (draft): points found while translating M4, M6, M9, M16

Các mục dưới đây không sửa trong English. Các câu tương ứng được để English trong bản si draft, hoặc được dịch kèm đánh dấu chưa xác minh.

B3-1. **M9 gocara (TERM_GOCARA, S05 body[1])**: English liệt kê "tangibility" như một gocararūpa cùng với sắc, thanh, hương, vị. Theo cách phân chia thông thường, gocararūpa gồm 4 (sắc, thanh, hương, vị); phoṭṭhabba là ba đại chủng (đất, lửa, gió) đã được tính trong đại chủng. Đề xuất: làm rõ trong English. Bản si dịch "ස්පර්ශ (පඨවි, තේජෝ, වායෝ ධාතු)" để giữ nghĩa English.

B3-2. **M6 S04 body[1] (ranking of unwholesome weighty kamma)**: English xếp tà kiến cố định > phá Tăng > làm chảy máu Phật > giết cha mẹ. Chandrikava 6-7 (pitaka.lk) không nêu thứ tự này. Đề xuất: ghi nguồn cụ thể, hoặc bỏ. Bản si để câu này bằng English.

B3-3. **M6 S05 body[3] and quiz M6_Q13 (fourth javana strongest)**: Chandrikava 6-7 nói năm javana giữa "ආසෙවන ප්‍රත්‍යය ලත් හෙයින් බලවත්" nhưng không chỉ đích danh javana thứ tư. Đề xuất: ghi nguồn cho việc javana thứ tư mạnh nhất, hoặc sửa câu. Bản si để English.

B3-4. **M6 S03 body[2] and card M6_R07 (obstructive kamma absent in form and formless realms)**: Chandrikava 6-6 không có nội dung này. Đề xuất: ghi nguồn. Bản si để English.

B3-5. **M16 S02 body[0] (mention of "lifespan")**: câu nêu "lifespan" có vẻ không liên quan đến chủ đề puggala (cảnh giới tái sinh). Đề xuất: admin kiểm tra.
