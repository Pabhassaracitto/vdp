
### v2.2 — 2026-07-02 (Cập nhật)

#### Completed
| Task | Nội dung | Status |
|------|----------|--------|
| M2-T5 | Scroll-to-top button cho Bảng Tương Ưng | ✅ DONE |
| M2-T6 | Detail sheet polish | ✅ DONE |
| M3-0B | Audit citta-module mapping | ✅ DONE |
| DATA-04 | Tích hợp Dữ liệu M5 (Rupa, Kamma, Paticca, Vithi) vào VdpRepository | ✅ DONE |

#### Milestone status
- **M2 — UX Polish: 100% DONE**
- **M5 — Data Integration: 100% DONE**
- Stable tag: `v0.2.0` *(nếu đã tạo stable tag theo policy)*

#### Important architecture decision
- `study_module.dart` là **source of truth** cho nội dung module học
- `cittas.json.moduleId` chỉ dùng như **audit hint**
- Không dùng trực tiếp `moduleId` từ JSON cho mọi module vì:
  - `M1_BASICS` map tới 18 tâm vô nhân
  - `M7_SIEU_THE` map tới 67 tâm (rộng hơn phạm vi “Siêu Thế”)

#### Data status
- **121/121 Tâm** ✅
- **52/52 Tâm Sở** ✅
- **Rupa, Kamma, Paticca, Vithi** ✅ Đã tích hợp vào Repository
