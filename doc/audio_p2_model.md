# P2 Sherpa model verification

Checked 2026-09-26. Sherpa-ONNX itself is Apache-2.0, but that does not grant a
license to redistribute every voice model. The upstream TTS model catalogue
lists Vietnamese candidates, but the candidate metadata/license and a stable
Android Flutter binding could not be verified in this checkout. Therefore VDP
**does not bundle or download a model** and does not claim neural Vietnamese
speech is enabled by default.

P2 provides `SherpaTtsBackend` and `SherpaTtsTrackPlayer`. A distribution may
install a model into app support storage after an explicit user download, after
checking its publisher license and SHA-256, then register a backend. The cache
key includes cue text, locale, model version and speed. Missing/corrupt model
falls back to P1 `flutter_tts` without crashing and never downloads on Play.
Generated WAV files and model files remain outside Git.

Before enabling a model, record here: publisher/model URL, license URL, model
version, SHA-256, Android/iOS ABI support, synthesis latency and Vietnamese/Pāli
QA result. Until those fields are filled, the DoD item “neural Vietnamese
voice on Android” is not complete.
