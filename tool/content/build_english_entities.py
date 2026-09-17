#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Normalise the English overlay for the Conditions and Mind Process tabs.

English is the international fallback locale (`kContentFallbackLocales`), so
before any other language is expanded or reviewed, every string the app can
show in `en` mode must actually be English. This script repairs the entity
sections that serve the *Conditions* (paticcas + paccayas) and *Mind Process*
(vithis) tabs:

* ``paticcas`` — the Tứ Nghĩa fields (characteristic / function /
  manifestation / proximateCause), ``examples`` and ``doctrinalNote`` were
  template placeholders; they are now faithful translations of the Vietnamese
  source in ``assets/data/paticca.json``.
* ``vithis`` — adds the missing ``arisingCondition`` / ``significance`` /
  ``doctrinalNote`` (per process) and ``doctrinalNote`` (per step), and
  replaces the generated "The X stage in this cognitive process" sentences
  with real translations. Step names use standard English Abhidhamma terms.
* ``paccayas`` — new section: the 24 Paṭṭhāna conditions had no English at
  all, so the tab fell back to the Vietnamese dataset.

Everything else in ``content_en.json`` (cittas, cetasikas, rupas, kammas,
studyModules, metadata) is preserved untouched: this script *merges*, it never
rewrites the whole file. Subdivision keys are taken from the dataset's
``namePali`` so they cannot drift.

Usage:
    python3 tool/content/build_english_entities.py
    python3 tool/content/build_english_entities.py --check   # no write; exit 1 if file is stale
"""
from __future__ import annotations

import argparse
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
DATA = os.path.join(ROOT, "assets", "data")
EN_PATH = os.path.join(ROOT, "assets", "content", "content_en.json")

# ---------------------------------------------------------------------------
# 12 links of dependent origination — Conditions tab, part A
# ---------------------------------------------------------------------------

PATICCAS = {
    "PD_01": {
        "name": "Ignorance",
        "shortName": "Ignorance",
        "description": (
            "Ignorance is not knowing the Four Noble Truths, the three "
            "characteristics, kamma and its results, and dependent "
            "origination. It is the first root of the round of rebirth: "
            "without ignorance formations do not arise and the chain of "
            "dependent arising cannot form."
        ),
        "characteristic": (
            "Not understanding — blindness to the true nature of things "
            "(the Four Truths, the three characteristics)."
        ),
        "function": (
            "To obscure clear seeing, and to serve as condition for the "
            "arising of formations."
        ),
        "manifestation": (
            "As bewilderment and darkness — it keeps generating kamma "
            "(formations) without one realising it."
        ),
        "proximateCause": (
            "Unwise attention (ayoniso-manasikāra); not meeting the wise and "
            "not hearing the True Dhamma."
        ),
        "doctrinalNote": (
            "Avijjā has no discernible beginning (anamatagga). The ending of "
            "ignorance is the attainment of the four path consciousnesses."
        ),
        "examples": [
            "Not knowing this body is impermanent, one clings to it as a self "
            "and creates kamma to protect that self.",
        ],
    },
    "PD_02": {
        "name": "Volitional formations",
        "shortName": "Formations",
        "description": (
            "Formations are kamma-forming activities — volition (cetanā) "
            "through the three doors of body, speech, and mind. They are of "
            "three kinds: meritorious formations (wholesome), demeritorious "
            "formations (unwholesome), and imperturbable formations "
            "(meditative attainments)."
        ),
        "characteristic": (
            "Acting and arranging — deliberate formation through body, "
            "speech, and mind."
        ),
        "function": (
            "To generate kamma — accumulating kammic force that will yield "
            "rebirth in a future life."
        ),
        "manifestation": (
            "As accumulated kamma that will draw consciousness into rebirth."
        ),
        "proximateCause": (
            "Ignorance as condition (without ignorance, formations become "
            "supramundane and create no new kamma)."
        ),
        "doctrinalNote": (
            "Saṅkhārā in dependent origination means the volition (cetanā) "
            "mental factor that forms kamma."
        ),
        "examples": [
            "Giving with a wholesome mind is a meritorious formation; its "
            "consciousness rebirth-links into a good destination.",
            "Attaining jhāna is an imperturbable formation; its "
            "consciousness rebirth-links as a Brahmā.",
        ],
    },
    "PD_03": {
        "name": "Consciousness",
        "shortName": "Consciousness",
        "description": (
            "Consciousness here means chiefly the rebirth-linking "
            "consciousness (paṭisandhi-citta) — the first mind of this life, "
            "continuing from the previous life and carrying kamma's seed."
        ),
        "characteristic": (
            "Knowing an object — the rebirth consciousness resting on the "
            "new mind-and-matter."
        ),
        "function": "To rebirth — to open a new life.",
        "manifestation": "A new existence takes shape — mind-and-matter appear.",
        "proximateCause": (
            "Kamma (formations) as condition; mind-and-matter must be there "
            "to rest on."
        ),
        "doctrinalNote": (
            "Consciousness and mind-and-matter lean on each other — like two "
            "sheaves of reeds propping one another up."
        ),
        "examples": [
            "At the moment of conception the rebirth-linking consciousness "
            "appears, mind-and-matter develop, and a new life begins.",
        ],
    },
    "PD_04": {
        "name": "Mind and matter",
        "shortName": "Mind-and-matter",
        "description": (
            "Mind-and-matter is the whole psycho-physical person: "
            "materiality (the body — the four great essentials and derived "
            "materiality) and mentality (consciousness together with its "
            "mental factors)."
        ),
        "characteristic": "Existing — mind and body present and developing.",
        "function": (
            "To serve as the ground on which consciousness operates, and the "
            "condition for the six sense bases to develop."
        ),
        "manifestation": "The six sense bases become fully formed.",
        "proximateCause": (
            "Consciousness as condition; the four sources producing "
            "materiality."
        ),
        "doctrinalNote": None,
        "examples": [
            "In the womb: rebirth consciousness appears and mind-and-matter "
            "gradually develop from embryo to full term.",
        ],
    },
    "PD_05": {
        "name": "Six sense bases",
        "shortName": "Sense bases",
        "description": (
            "The six sense bases are the six places where objects are "
            "received: the eye, ear, nose, tongue, body, and mind bases — "
            "six doors through which the mind receives the six objects."
        ),
        "characteristic": (
            "Readiness to receive — six doors through which objects enter."
        ),
        "function": (
            "To serve as doors (dvāra) through which the mind meets outer "
            "objects."
        ),
        "manifestation": (
            "Contact (phassa) is established — the mind can touch its object."
        ),
        "proximateCause": "Fully developed mind-and-matter as condition.",
        "doctrinalNote": None,
        "examples": [
            "A newborn child: with the six bases complete, contact with the "
            "outside world begins.",
        ],
    },
    "PD_06": {
        "name": "Contact",
        "shortName": "Contact",
        "description": (
            "Contact is the meeting of three factors: sense base + object + "
            "consciousness. It is the condition for feeling to arise."
        ),
        "characteristic": (
            "Touching — the encounter of base, object, and consciousness."
        ),
        "function": (
            "To gather base, object, and consciousness together — "
            "conditioning the arising of feeling."
        ),
        "manifestation": (
            "Mind, mental factors, base, and object come together."
        ),
        "proximateCause": (
            "All three must be present: base + object + consciousness."
        ),
        "doctrinalNote": (
            "Phassa in dependent origination is the contact mental factor "
            "(CS_PHASSA)."
        ),
        "examples": [
            "The eye sees a lovely object: eye-base + visible object + "
            "eye-consciousness give eye-contact, and glad feeling follows.",
        ],
    },
    "PD_07": {
        "name": "Feeling",
        "shortName": "Feeling",
        "description": (
            "Feeling is the experience that follows contact — glad, sad, "
            "pleasant, painful, or neutral. This is the most important point "
            "of meditation practice: stop at feeling, and do not let feeling "
            "lead on to craving."
        ),
        "characteristic": (
            "Experiencing — tasting the object as pleasant, painful, or "
            "neutral after contact."
        ),
        "function": (
            "To enjoy the object — conditioning craving to arise when "
            "unwise attention prevails."
        ),
        "manifestation": (
            "As pleasant, painful, or neutral experience forming in the mind."
        ),
        "proximateCause": "Contact as condition.",
        "doctrinalNote": (
            "This is the crux of the four foundations of mindfulness: halt "
            "at feeling, and do not let it ripen into craving."
        ),
        "examples": [
            "Hearing praise (contact) brings glad feeling; without "
            "mindfulness, craving for more follows.",
        ],
    },
    "PD_08": {
        "name": "Craving",
        "shortName": "Craving",
        "description": (
            "Craving is thirst, the intense wanting. It is of three kinds: "
            "craving for sense pleasures, craving for existence, and craving "
            "for non-existence. Craving is the Truth of the Origin — the "
            "root of suffering."
        ),
        "characteristic": (
            "Thirsting — the clinging wanting produced by feeling."
        ),
        "function": (
            "To grasp at its object — conditioning the arising of clinging."
        ),
        "manifestation": (
            "As clinging taking hold; the round of rebirth continues."
        ),
        "proximateCause": (
            "Feeling (especially glad and pleasant feeling) as condition."
        ),
        "doctrinalNote": (
            "Craving is the Origin of suffering among the Four Noble Truths. "
            "The ending of craving is the ending of suffering — Nibbāna."
        ),
        "examples": [
            "Seeing delicious food, craving arises: wanting to eat more.",
            "Meeting pain, craving for non-existence arises: wanting not to "
            "be.",
        ],
    },
    "PD_09": {
        "name": "Clinging",
        "shortName": "Clinging",
        "description": (
            "Clinging is grasping tighter than craving. It is of four kinds: "
            "clinging to sense pleasures, to views, to rules and "
            "observances, and to a doctrine of self."
        ),
        "characteristic": (
            "Holding tight — a grip that does not let go."
        ),
        "function": (
            "To grasp the object firmly — conditioning the arising of "
            "becoming."
        ),
        "manifestation": (
            "As becoming taking shape — rebirth-producing kamma accumulates."
        ),
        "proximateCause": (
            "Craving as condition — clinging is craving intensified and "
            "consolidated."
        ),
        "doctrinalNote": None,
        "examples": [
            "Not only wanting money (craving) but being unable to let money "
            "go (clinging).",
        ],
    },
    "PD_10": {
        "name": "Becoming",
        "shortName": "Becoming",
        "description": (
            "Becoming has two parts: kamma-becoming (kamma accumulated that "
            "will produce rebirth) and rebirth-becoming (the plane of "
            "existence into which rebirth will occur). There are three "
            "realms of becoming: sense-sphere, form-sphere, and "
            "formless-sphere becoming."
        ),
        "characteristic": (
            "Existing — accumulated kammic force ready to produce rebirth."
        ),
        "function": "To condition birth taking place in a future life.",
        "manifestation": (
            "As rebirth occurring in a plane that matches the kamma."
        ),
        "proximateCause": (
            "Clinging as condition — clinging is the fuel for becoming."
        ),
        "doctrinalNote": None,
        "examples": [
            "One who gives generously all their life builds wholesome "
            "sense-sphere becoming and is reborn wealthy in the next life.",
        ],
    },
    "PD_11": {
        "name": "Birth",
        "shortName": "Birth",
        "description": (
            "Birth is rebirth — the rebirth-linking consciousness appearing "
            "in a new life, mind-and-matter forming, the aggregates arising. "
            "All suffering begins here."
        ),
        "characteristic": (
            "Rebirth-linking — consciousness reborn into a new plane."
        ),
        "function": (
            "To open a new life — dragging the whole mass of suffering "
            "along."
        ),
        "manifestation": "As suffering (ageing-and-death) appearing.",
        "proximateCause": "Becoming (kammic force) as condition.",
        "doctrinalNote": (
            "The three-life circle joins here: birth (PD_11) corresponds to "
            "consciousness (PD_03) on the result side of the future life."
        ),
        "examples": [
            "The moment of conception is birth — all suffering follows from "
            "it.",
        ],
    },
    "PD_12": {
        "name": "Ageing and death",
        "shortName": "Ageing-death",
        "description": (
            "Ageing-and-death: ageing is growing old and decaying; death is "
            "falling. Together with them come sorrow, lamentation, pain, "
            "grief, and despair — all the suffering of a life. It is the "
            "final result that closes one life and, if there is no "
            "liberation, opens a new round."
        ),
        "characteristic": (
            "Ageing and dying — the inevitable decay and perishing of all "
            "conditioned mind and body."
        ),
        "function": (
            "To end a life — and to continue a new round of becoming if "
            "liberation has not been won."
        ),
        "manifestation": (
            "A life closed; without liberation the round continues."
        ),
        "proximateCause": (
            "Birth as condition — where there is birth, ageing-and-death "
            "necessarily follow."
        ),
        "doctrinalNote": (
            "Liberation means ending ignorance (PD_01) and craving (PD_08) — "
            "the realisation of Nibbāna."
        ),
        "examples": [
            "Every being that has been born must age and die.",
            "When ignorance and craving are destroyed, ageing-and-death no "
            "longer follow.",
        ],
    },
}

# ---------------------------------------------------------------------------
# The 24 Paṭṭhāna conditions — Conditions tab, part B (previously untranslated)
# ---------------------------------------------------------------------------

PACCAYAS = {
    "PC_01": {
        "name": "Root condition",
        "shortName": "Root",
        "definition": (
            "The six roots (hetu) support their associated mental states and "
            "the materiality produced by those roots, firmly the way roots "
            "sustain a tree."
        ),
        "paccayaDhamma": (
            "The six roots: greed (lobha), hatred (dosa), delusion (moha), "
            "non-greed (alobha), non-hatred (adosa), non-delusion (amoha)."
        ),
        "paccayuppanna": (
            "The mind states associated with a root (citta and cetasikas), "
            "and the materiality that mind produces — mind-born materiality "
            "in the course of existence, kamma-born materiality at rebirth."
        ),
        "examples": [
            "A greed-rooted consciousness carries the two roots greed and "
            "delusion: together they make the whole mind-moment "
            "unwholesome.",
            "A rootless (ahetuka) consciousness has no root and therefore "
            "receives no root condition — for example, the two receiving "
            "consciousnesses.",
        ],
        "doctrinalNote": (
            "Only the six root cetasikas are roots; however strong the other "
            "mental factors may be, they support their states only through "
            "other conditions."
        ),
    },
    "PC_02": {
        "name": "Object condition",
        "shortName": "Object",
        "definition": (
            "An object supports mind and mental factors by serving as the "
            "thing known; without an object no consciousness arises."
        ),
        "paccayaDhamma": (
            "The six objects: visible form, sound, odour, taste, tangible "
            "data, and mind objects (including Nibbāna and meditative "
            "attainments)."
        ),
        "paccayuppanna": (
            "All 89 cittas — every citta that knows an object — together "
            "with the 52 mental factors."
        ),
        "examples": [
            "A visible object (an image) serves as object condition for "
            "eye-consciousness and its associated mental factors.",
            "Nibbāna serves as object condition for supramundane "
            "consciousness.",
        ],
        "doctrinalNote": (
            "According to Visuddhimagga XVII, ignorance serves as object "
            "condition for wholesome formations when a meditator examines "
            "ignorance with wisdom."
        ),
    },
    "PC_03": {
        "name": "Predominance condition",
        "shortName": "Predominance",
        "definition": (
            "A dominant factor — the one given most weight in a moment — "
            "supports the states that arise with it; or an object, held "
            "predominant, supports the mind that takes it seriously."
        ),
        "paccayaDhamma": (
            "The four conascent dominants — desire-to-act (chanda), energy "
            "(viriya), consciousness (citta), and investigation (vīmaṃsā, "
            "wisdom); and the predominant object."
        ),
        "paccayuppanna": (
            "The mental states that arise together with a dominant; for the "
            "predominant object, the 84 cittas (excluding rootless "
            "resultant cittas) and their associated mental factors."
        ),
        "subdivisions": {
            "Sahajāt'ādhipati": (
                "Conascent dominance",
                "One of the four — desire, energy, consciousness, "
                "investigation — that stands out in a single mind-moment.",
            ),
            "Ārammaṇ'ādhipati": (
                "Object dominance",
                "An object held predominant, governing the mind that takes "
                "it as its object.",
            ),
        },
        "examples": [
            "When a meditator's effort is at its strongest, energy "
            "predominates over the whole jhāna mind-moment.",
            "A person besotted with a precious thing: that thing is the "
            "predominant object for the greedy mind.",
        ],
        "doctrinalNote": (
            "No predominance condition occurs among the 18 rootless cittas, "
            "nor in cittas where only one dominant is possible."
        ),
    },
    "PC_04": {
        "name": "Proximity condition",
        "shortName": "Proximity",
        "definition": (
            "Mind and mental factors that have just ceased give way, and "
            "thereby support the arising of the immediately following mind "
            "and mental factors without interruption."
        ),
        "paccayaDhamma": (
            "The consciousness and mental factors that have just ceased "
            "(except the dying consciousness of an Arahant)."
        ),
        "paccayuppanna": (
            "The mind and mental factors that arise immediately afterwards."
        ),
        "examples": [
            "Eye-consciousness, on ceasing, is proximity condition for the "
            "receiving consciousness in a five-door process.",
            "The rebirth-linking consciousness, on ceasing, is proximity "
            "condition for the first life-continuum moment.",
        ],
        "doctrinalNote": (
            "Proximity condition underlies the continuity of the stream of "
            "consciousness — there is no gap between two mind-moments."
        ),
    },
    "PC_05": {
        "name": "Contiguity condition",
        "shortName": "Contiguity",
        "definition": (
            "Identical in meaning to proximity condition; it stresses "
            "immediate succession from mind-moment to mind-moment with "
            "nothing intervening."
        ),
        "paccayaDhamma": (
            "The consciousness and mental factors that have just ceased."
        ),
        "paccayuppanna": (
            "The mind and mental factors that follow immediately."
        ),
        "examples": [
            "The same relation is called proximity when spoken of as 'giving "
            "way', and contiguity when spoken of as 'following immediately'.",
        ],
        "doctrinalNote": (
            "These two conditions are one reality, differing only in "
            "presentation — like the two sides of a coin."
        ),
    },
    "PC_06": {
        "name": "Conascence condition",
        "shortName": "Conascence",
        "definition": (
            "A state supports another state by arising together with it in "
            "one mind-moment, as three sticks propped against one another "
            "stand."
        ),
        "paccayaDhamma": (
            "The four mental aggregates that arise together; the four great "
            "essentials; mind and its factors in the course of existence; "
            "and name and materiality at rebirth."
        ),
        "paccayuppanna": (
            "The mental states conascent with one another, mind-born and "
            "kamma-born materiality in the course of existence, and the "
            "name–materiality that support one another at rebirth."
        ),
        "examples": [
            "In one greedy mind-moment, feeling, perception, formations, and "
            "consciousness arise together and support one another.",
            "At rebirth-linking, the rebirth consciousness and kamma-born "
            "materiality support each other through conascence condition.",
        ],
        "doctrinalNote": (
            "This is the condition most used to explain the simultaneity of "
            "name and materiality within a single mind-moment."
        ),
    },
    "PC_07": {
        "name": "Mutuality condition",
        "shortName": "Mutuality",
        "definition": (
            "Conascent states support one another reciprocally: each is at "
            "once the conditioning state and the conditioned state of the "
            "others."
        ),
        "paccayaDhamma": (
            "The four conascent mental aggregates; the four great "
            "essentials; name and materiality at rebirth."
        ),
        "paccayuppanna": "Those very states — the relation is two-way.",
        "examples": [
            "The four great essentials: the earth element supports the water "
            "element and the water element supports the earth — no element "
            "stands alone.",
        ],
        "doctrinalNote": (
            "Mutuality always accompanies conascence, but is narrower: "
            "materiality born of mind is not mutual with consciousness."
        ),
    },
    "PC_08": {
        "name": "Dependence condition",
        "shortName": "Dependence",
        "definition": (
            "A state supports another by being its base or foothold, as a "
            "tree rests on the earth and a picture on its cloth."
        ),
        "paccayaDhamma": (
            "The four conascent mental aggregates; the four great "
            "essentials; and the six bases (eye, ear, nose, tongue, body, "
            "and heart-base)."
        ),
        "paccayuppanna": (
            "The conascent mental states; derived materiality; and the seven "
            "consciousness-elements together with their mental factors."
        ),
        "subdivisions": {
            "Sahajāta-nissaya": (
                "Conascent dependence",
                "Mutual reliance within a single mind-moment.",
            ),
            "Purejāta-nissaya (vatthu)": (
                "Prenascence dependence — bases",
                "The six bases, arisen beforehand, serve as the support for "
                "the seven consciousness-elements.",
            ),
            "Vatthārammaṇa-purejāta-nissaya": (
                "Base-object prenascence dependence",
                "The heart-base serves at once as base and as object for "
                "mind-element consciousness.",
            ),
        },
        "examples": [
            "The eye-base is dependence condition for eye-consciousness and "
            "its associated mental factors.",
            "The heart-base (hadaya-vatthu) supports the whole "
            "mind-consciousness element throughout the life of the five "
            "aggregates.",
        ],
        "doctrinalNote": (
            "Distinguish from decisive support: dependence is the direct "
            "base, decisive support is strong assistance from a distance."
        ),
    },
    "PC_09": {
        "name": "Decisive support condition",
        "shortName": "Decisive support",
        "definition": (
            "A state supports another powerfully and decisively, as a "
            "particularly firm foothold that draws the mind after it."
        ),
        "paccayaDhamma": (
            "An object strongly attended to; consciousness that has just "
            "ceased; and natural conditions such as faith, virtue, climate, "
            "food, and friends."
        ),
        "paccayuppanna": (
            "The mind and mental factors that arise afterwards."
        ),
        "subdivisions": {
            "Ārammaṇ'ūpanissaya": (
                "Object decisive support",
                "A powerful object becomes the decisive spur for the "
                "consciousness that follows.",
            ),
            "Anantar'ūpanissaya": (
                "Contiguous decisive support",
                "Equivalent to proximity condition considered as a force of "
                "support.",
            ),
            "Pakat'ūpanissaya": (
                "Natural decisive support",
                "Natural conditions: faith, virtue, climate, friends, former "
                "kamma.",
            ),
        },
        "examples": [
            "Pleasant feeling is natural decisive support for craving — "
            "because feeling is agreeable, craving grows strong.",
            "Faith decisively supports an act of generosity; greed "
            "decisively supports an act of stealing.",
        ],
        "doctrinalNote": (
            "The link Feeling → Craving in dependent origination is explained "
            "chiefly through natural decisive support."
        ),
    },
    "PC_10": {
        "name": "Prenascence condition",
        "shortName": "Prenascence",
        "definition": (
            "Materiality that has arisen earlier and still exists supports "
            "mental states that arise later, as the sun must exist before it "
            "can shine."
        ),
        "paccayaDhamma": (
            "The six bases (materiality) and the six objects — the "
            "concrete material phenomena — that have already arisen."
        ),
        "paccayuppanna": (
            "The mind and mental factors that arise later."
        ),
        "subdivisions": {
            "Vatthu-purejāta": (
                "Base prenascence",
                "The six bases support the seven consciousness-elements.",
            ),
            "Ārammaṇa-purejāta": (
                "Object prenascence",
                "Present concrete objects support the 54 sense-sphere cittas "
                "and 50 mental factors.",
            ),
        },
        "examples": [
            "The eye-base must exist first; only then can eye-consciousness "
            "arise.",
            "A present visible object (17 mind-moments long) serves as "
            "prenascence condition for an eye-door process.",
        ],
        "doctrinalNote": (
            "Prenascence applies only to materiality; mental states cannot "
            "be prenascence conditions."
        ),
    },
    "PC_11": {
        "name": "Postnascence condition",
        "shortName": "Postnascence",
        "definition": (
            "Mental states that arise later support and sustain materiality "
            "that arose earlier, as rain nourishes a tree already planted."
        ),
        "paccayaDhamma": (
            "The 85 cittas of the sense-sphere, form-sphere, formless-sphere "
            "and supramundane planes — that is, all consciousness except the "
            "rebirth-linking cittas — together with the 52 mental factors."
        ),
        "paccayuppanna": (
            "The kamma-born body of materiality that arose earlier (the "
            "materiality of the living body)."
        ),
        "examples": [
            "Mind and mental factors during life support the body already "
            "born, keeping it from decay.",
            "Hunger drives one to eat — later-arising mentality nourishes "
            "earlier-born materiality.",
        ],
        "doctrinalNote": (
            "Only later-arising mentality supports earlier materiality; "
            "never the reverse."
        ),
    },
    "PC_12": {
        "name": "Repetition condition",
        "shortName": "Repetition",
        "definition": (
            "An impulsion (javana) supports the impulsion that follows "
            "through repetition, so that the mind gathers strength moment "
            "after moment."
        ),
        "paccayaDhamma": (
            "The preceding impulsion consciousness and its mental factors "
            "(except the final impulsion and the path impulsion)."
        ),
        "paccayuppanna": (
            "The impulsion consciousness and its factors arising immediately "
            "after."
        ),
        "examples": [
            "Among the seven impulsions, the first is repetition condition "
            "for the second.",
            "Memorising by repeated recitation makes each later attempt "
            "easier — the same principle at work.",
        ],
        "doctrinalNote": (
            "A supramundane path impulsion is not repetition condition, "
            "because it arises for a single mind-moment only."
        ),
    },
    "PC_13": {
        "name": "Kamma condition",
        "shortName": "Kamma",
        "definition": (
            "Volition (cetanā) supports its associated states and the "
            "materiality it produces, or supports results arising in other "
            "mind-moments."
        ),
        "paccayaDhamma": (
            "Wholesome and unwholesome volition — the cetanā mental factor."
        ),
        "paccayuppanna": (
            "Conascent kamma: the citta and cetasikas arising with it, and "
            "mind-born materiality. Asynchronous kamma: resultant "
            "consciousness, its mental factors, and kamma-born materiality "
            "at rebirth."
        ),
        "subdivisions": {
            "Sahajāta-kamma": (
                "Conascent kamma",
                "Volition supports the states arising with it in the same "
                "mind-moment.",
            ),
            "Nānākkhaṇika-kamma": (
                "Asynchronous kamma",
                "Volition in one mind-moment supports its result in another — "
                "the basis of rebirth.",
            ),
        },
        "examples": [
            "Volition in an act of generosity supports resultant mind and "
            "kamma-born materiality in a future life (asynchronous kamma).",
            "Volition in a greedy mind-moment makes that whole mind-moment "
            "unwholesome (conascent kamma).",
        ],
        "doctrinalNote": (
            "The links Formations → Consciousness and Becoming → Birth among "
            "the twelve links are explained through asynchronous kamma "
            "condition."
        ),
    },
    "PC_14": {
        "name": "Result condition",
        "shortName": "Result",
        "definition": (
            "Resultant mental states support one another, and support "
            "kamma-born materiality, through their calm passivity — without "
            "any exertion."
        ),
        "paccayaDhamma": (
            "The 36 resultant cittas (rootless, sense-sphere beautiful, and "
            "great resultants) together with their 38 associated mental "
            "factors."
        ),
        "paccayuppanna": (
            "The resultant mental states that arise together, and the "
            "kamma-born materiality they produce."
        ),
        "examples": [
            "Rebirth-linking consciousness is a resultant: it supports the "
            "kamma-born materiality arising together with it.",
            "Eye-consciousness is resultant mind — it supports its "
            "conascent mental factors by result condition without creating "
            "new kamma.",
        ],
        "doctrinalNote": (
            "Resultant consciousness creates no new kamma — the key point "
            "for understanding that 'a result does not produce a result'."
        ),
    },
    "PC_15": {
        "name": "Nutriment condition",
        "shortName": "Nutriment",
        "definition": (
            "A state nourishes other states so that they grow strong and "
            "endure."
        ),
        "paccayaDhamma": (
            "Edible food (materiality) and the three mental nutriments: "
            "contact, volition, and consciousness."
        ),
        "paccayuppanna": (
            "Food materiality sustains the body; the three mental nutriments "
            "sustain mind, mental factors, and mind-born materiality."
        ),
        "subdivisions": {
            "Rūp'āhāra": (
                "Edible food",
                "Physical nutriment sustains the body.",
            ),
            "Nām'āhāra": (
                "Mental nutriment",
                "Contact, volition, and consciousness as nutriments.",
            ),
        },
        "examples": [
            "Food sustains the material body — edible food.",
            "Volition nutriment: intention feeds kamma and prolongs the "
            "round of birth and death.",
        ],
        "doctrinalNote": (
            "Connect with the Four Nutriments in the Sutta Piṭaka (SN 12.63) "
            "— the contemplation of nutriment."
        ),
    },
    "PC_16": {
        "name": "Faculty condition",
        "shortName": "Faculty",
        "definition": (
            "A faculty rules over its own domain, supporting its associated "
            "states or the states it governs."
        ),
        "paccayaDhamma": (
            "The 20 faculties: five sensitive material faculties, the "
            "material life faculty, and fourteen mental faculties — feeling, "
            "faith, energy, mindfulness, concentration, wisdom, the three "
            "understanding faculties, and the mind faculty."
        ),
        "paccayuppanna": (
            "The sensitive faculties support the seven "
            "consciousness-elements; the mental faculties support the "
            "conascent mind and its factors; the material life faculty "
            "sustains kamma-born materiality."
        ),
        "subdivisions": {
            "Purejāta-indriya": (
                "Prenascence faculties",
                "The five sensitive faculties support the consciousnesses "
                "they correspond to.",
            ),
            "Jīvit'indriya": (
                "Material life faculty",
                "Sustains the kamma-born materiality of its own group.",
            ),
            "Sahajāta-indriya": (
                "Conascent faculties",
                "The fourteen mental faculties support the mind and factors "
                "arising with them.",
            ),
        },
        "examples": [
            "The eye faculty governs eye-consciousness — without the eye "
            "faculty there is no seeing.",
            "The concentration faculty rules the whole jhāna mind-moment.",
        ],
        "doctrinalNote": (
            "The five spiritual faculties — faith, energy, mindfulness, "
            "concentration, wisdom — must be balanced in meditation."
        ),
    },
    "PC_17": {
        "name": "Jhāna condition",
        "shortName": "Jhāna",
        "definition": (
            "The jhāna factors support their associated states by closely "
            "contemplating the object."
        ),
        "paccayaDhamma": (
            "The seven jhāna factors: applied thought, sustained thought, "
            "rapture, pleasure, displeasure, equanimity, and "
            "one-pointedness."
        ),
        "paccayuppanna": (
            "The associated mind and mental factors (except the two body "
            "consciousnesses), and the materiality produced by that mind."
        ),
        "examples": [
            "Applied thought brings the mind to the object — it is jhāna "
            "condition for the factors arising with it.",
            "In the second jhāna applied thought is absent, yet rapture and "
            "one-pointedness still function as jhāna condition.",
        ],
        "doctrinalNote": (
            "Not limited to meditative attainment: the seven jhāna factors "
            "operate in ordinary consciousness as well."
        ),
    },
    "PC_18": {
        "name": "Path condition",
        "shortName": "Path",
        "definition": (
            "The twelve path factors lead their associated states onward, as "
            "a road leads to its destination."
        ),
        "paccayaDhamma": (
            "The twelve path factors: right view, right intention, right "
            "speech, right action, right livelihood, right effort, right "
            "mindfulness, right concentration — and wrong view, wrong "
            "intention, wrong effort, wrong one-pointedness."
        ),
        "paccayuppanna": (
            "The associated mind and mental factors (except the two body "
            "consciousnesses), and the materiality produced by that mind."
        ),
        "examples": [
            "Right view in a wholesome mind steers the whole mind-moment "
            "toward the wholesome.",
            "Wrong view in a greedy mind steers it toward the unwholesome — "
            "path condition has two faces.",
        ],
        "doctrinalNote": (
            "Path condition operates in wholesome and unwholesome states "
            "alike — not only in the supramundane Noble Eightfold Path."
        ),
    },
    "PC_19": {
        "name": "Association condition",
        "shortName": "Association",
        "definition": (
            "Mental states support one another through their union: one "
            "object, one base, arising and ceasing together."
        ),
        "paccayaDhamma": "The four conascent mental aggregates.",
        "paccayuppanna": (
            "Those very four aggregates — a two-way relation."
        ),
        "examples": [
            "Feeling and perception in one mind-moment are associated: they "
            "know one object through one base.",
        ],
        "doctrinalNote": (
            "Only mentality can be associated; materiality has no shared "
            "object and base, so it cannot be associated."
        ),
    },
    "PC_20": {
        "name": "Dissociation condition",
        "shortName": "Dissociation",
        "definition": (
            "Mentality supports materiality, or materiality supports "
            "mentality, while remaining of a different kind — as water "
            "supports the lotus growing in it."
        ),
        "paccayaDhamma": (
            "Mental states (when supporting materiality), or material "
            "phenomena (when supporting mentality)."
        ),
        "paccayuppanna": (
            "Material phenomena (conascent or prenascent), or mental states "
            "(conascent or postnascent)."
        ),
        "subdivisions": {
            "Sahajāta-vippayutta": (
                "Conascent dissociation",
                "Mind and materiality arise together yet support each other "
                "as different kinds — at rebirth-linking.",
            ),
            "Purejāta-vippayutta": (
                "Prenascence dissociation",
                "The six bases, arisen earlier, support the seven "
                "consciousness-elements.",
            ),
            "Pacchājāta-vippayutta": (
                "Postnascence dissociation",
                "Later-arising mentality supports the earlier-born body of "
                "materiality.",
            ),
        },
        "examples": [
            "The heart-base (materiality) supports mind-consciousness "
            "(mentality) — different kinds, hence dissociation condition.",
            "At rebirth-linking, the rebirth consciousness and kamma-born "
            "materiality arise together yet remain different kinds.",
        ],
        "doctrinalNote": (
            "This condition expresses the mind–matter relation, the backbone "
            "of the Name-and-Form analysis among the twelve links."
        ),
    },
    "PC_21": {
        "name": "Presence condition",
        "shortName": "Presence",
        "definition": (
            "A state that is present — whether conascent or prenascent — "
            "supports other states simply by being there."
        ),
        "paccayaDhamma": (
            "Comprises the states serving as conascence, prenascence, "
            "postnascence, nutriment, and faculty conditions."
        ),
        "paccayuppanna": "The states supported by those five conditions.",
        "subdivisions": {
            "Sahajāta-atthi": (
                "Conascent presence",
                "Present within the same mind-moment.",
            ),
            "Purejāta-atthi": (
                "Prenascence presence",
                "Earlier-born materiality still existing.",
            ),
            "Pacchājāta-atthi": (
                "Postnascence presence",
                "Later-arising mentality being present.",
            ),
            "Āhāra-atthi": (
                "Nutriment presence",
                "Edible food being present.",
            ),
            "Indriya-atthi": (
                "Faculty presence",
                "The material life faculty being present.",
            ),
        },
        "examples": [
            "The eye-base being present, eye-consciousness can arise — "
            "presence condition.",
            "The four great essentials being present support the derived "
            "materiality.",
        ],
        "doctrinalNote": (
            "The widest of the 24 conditions — it subsumes five others."
        ),
    },
    "PC_22": {
        "name": "Absence condition",
        "shortName": "Absence",
        "definition": (
            "Mind and mental factors that have just ceased — precisely "
            "because they are no longer there — give room for the next "
            "consciousness to arise."
        ),
        "paccayaDhamma": (
            "The consciousness and mental factors that have just ceased."
        ),
        "paccayuppanna": (
            "The mind and mental factors arising immediately after."
        ),
        "examples": [
            "Eye-consciousness must cease for the receiving consciousness to "
            "arise.",
        ],
        "doctrinalNote": (
            "Same scope as proximity condition, but stressing the absence of "
            "the preceding consciousness."
        ),
    },
    "PC_23": {
        "name": "Disappearance condition",
        "shortName": "Disappearance",
        "definition": (
            "Identical in meaning to absence condition: a state, having "
            "gone, thereby supports the state that follows."
        ),
        "paccayaDhamma": (
            "The consciousness and mental factors that have just ceased."
        ),
        "paccayuppanna": (
            "The mind and mental factors arising immediately after."
        ),
        "examples": [
            "A life-continuum moment, just ceased (disappeared), supports "
            "the next life-continuum moment.",
        ],
        "doctrinalNote": (
            "One reality, two sayings: absence stresses 'no longer there'; "
            "disappearance stresses 'has gone'."
        ),
    },
    "PC_24": {
        "name": "Non-disappearance condition",
        "shortName": "Non-disappearance",
        "definition": (
            "Identical in meaning to presence condition: a state, not yet "
            "gone, keeps supporting the other states."
        ),
        "paccayaDhamma": (
            "Comprises the states serving as conascence, prenascence, "
            "postnascence, nutriment, and faculty conditions."
        ),
        "paccayuppanna": "The states supported by those five conditions.",
        "examples": [
            "The heart-base, not yet perished, keeps supporting "
            "mind-consciousness.",
        ],
        "doctrinalNote": (
            "The pairs 21–24 (presence / absence / disappearance / "
            "non-disappearance) close the 24 conditions with two pairs of "
            "synonyms."
        ),
    },
}

# ---------------------------------------------------------------------------
# The four cognitive processes — Mind Process tab
# ---------------------------------------------------------------------------

VITHIS = {
    "VT_NGU_MON_RATLON": {
        "name": "Atimahanta-ārammaṇa Pañcadvāra-vīthi",
        "shortName": "Very great object, five-door",
        "description": (
            "The most complete process — it arises when a five-sense object "
            "strikes very strongly. All 17 mind-moments occur: 2 vibrating "
            "and 1 arresting bhavaṅga, 5 rootless cittas, 7 impulsions, and "
            "2 registrations."
        ),
        "arisingCondition": (
            "A five-sense object (visible form, sound, odour, taste, "
            "tangibility) strikes its corresponding sense base very "
            "strongly."
        ),
        "significance": (
            "The most complete process — the 7 impulsions create kamma in "
            "full, and registration enjoys the residual object."
        ),
        "doctrinalNote": (
            "Atimahanta = an object great enough to allow Javana × 7 plus "
            "Tadārammaṇa × 2."
        ),
        "steps": {
            "1": {
                "name": "Past bhavaṅga",
                "description": (
                    "The life-continuum flowing along normally before the "
                    "object strikes."
                ),
                "doctrinalNote": (
                    "The same class of citta as this person's rebirth-linking "
                    "and dying consciousness."
                ),
            },
            "2": {
                "name": "Vibrating bhavaṅga",
                "description": (
                    "The object strikes the sense base and the life-continuum "
                    "vibrates for the first time."
                ),
            },
            "3": {
                "name": "Arrest bhavaṅga",
                "description": (
                    "The bhavaṅga stream is fully cut off — the cognitive "
                    "process begins."
                ),
                "doctrinalNote": (
                    "After this moment the five-door adverting consciousness "
                    "arises."
                ),
            },
            "4": {
                "name": "Five-door adverting",
                "description": (
                    "Opens the five-sense door and turns toward the object, "
                    "determining which door the object has struck."
                ),
                "doctrinalNote": (
                    "CI_028 — equanimity feeling, 11 mental factors. Creates "
                    "no kamma."
                ),
            },
            "5": {
                "name": "Five-fold sense consciousness",
                "description": (
                    "Knows the object through the corresponding sense door. "
                    "Only the seven universal mental factors accompany it."
                ),
                "doctrinalNote": (
                    "Unwholesome-resultant (CI_013–017) or "
                    "wholesome-resultant (CI_020–024), according to rebirth "
                    "kamma."
                ),
            },
            "6": {
                "name": "Receiving",
                "description": (
                    "Receives the object from the sense consciousness and "
                    "passes it into the inner stream of consciousness."
                ),
                "doctrinalNote": (
                    "CI_018 = unwholesome-resultant with equanimity; CI_025 = "
                    "wholesome-resultant with equanimity. 10 mental factors."
                ),
            },
            "7": {
                "name": "Investigating",
                "description": (
                    "Examines the object — determining whether it is good or "
                    "bad, pleasing or not."
                ),
                "doctrinalNote": (
                    "CI_027 (with joy) appears only when the object is very "
                    "beautiful."
                ),
            },
            "8": {
                "name": "Determining",
                "description": (
                    "Makes the final determination of the object as good or "
                    "bad — opening the way for the 7 impulsions."
                ),
                "doctrinalNote": (
                    "CI_029 (mind-door adverting) plays the role of "
                    "determining. 11 mental factors. It decides the kind of "
                    "javana that follows."
                ),
            },
            "9": {
                "name": "Impulsion (Javana)",
                "description": (
                    "Seven consecutive impulsion moments — creating "
                    "wholesome or unwholesome kamma. Moment 1 bears fruit in "
                    "this very life; moment 7 in the next life; moments 2–6 "
                    "in later lives."
                ),
                "doctrinalNote": (
                    "7 moments of one and the same class of citta. The only "
                    "part of the process that creates kamma."
                ),
            },
            "10": {
                "name": "Registration (Tadārammaṇa)",
                "description": (
                    "Two registration moments enjoying the residual object "
                    "after the impulsions. They occur only in a "
                    "very-great-object process and create no new kamma."
                ),
                "doctrinalNote": (
                    "Tadā = 'then'; ārammaṇa = object. They arise only when "
                    "the object is great enough."
                ),
            },
            "11": {
                "name": "Post-process bhavaṅga",
                "description": (
                    "After the process ends, the life-continuum resumes its "
                    "normal flow."
                ),
            },
        },
    },
    "VT_NGU_MON_LON": {
        "name": "Mahanta-ārammaṇa Pañcadvāra-vīthi",
        "shortName": "Great object, five-door",
        "description": (
            "A five-door process with the full 7 impulsions but NO "
            "registration — the object is not strong enough for tadārammaṇa "
            "to arise."
        ),
        "arisingCondition": (
            "A five-sense object strong enough for 7 impulsions, but not "
            "strong enough to produce registration."
        ),
        "significance": (
            "The most ordinary process — kamma is created in full through "
            "the 7 impulsions."
        ),
        "doctrinalNote": (
            "It differs from the very-great-object process only in lacking "
            "the 2 registration moments."
        ),
        "steps": {
            "1": {
                "name": "Vibrating bhavaṅga",
                "description": (
                    "The life-continuum vibrates as the object strikes the "
                    "sense base."
                ),
            },
            "2": {
                "name": "Arrest bhavaṅga",
                "description": (
                    "The bhavaṅga stream is cut off — the process begins."
                ),
            },
            "3": {
                "name": "Five-door adverting",
                "description": (
                    "Turns the mind toward the object through the five-sense "
                    "door."
                ),
            },
            "4": {
                "name": "Five-fold sense consciousness",
                "description": (
                    "Knows the object through the corresponding sense."
                ),
            },
            "5": {
                "name": "Receiving",
                "description": "Receives the object.",
            },
            "6": {
                "name": "Investigating",
                "description": "Examines the object.",
            },
            "7": {
                "name": "Determining",
                "description": (
                    "Determines the object, opening the way for the "
                    "impulsions."
                ),
            },
            "8": {
                "name": "Impulsion (Javana)",
                "description": (
                    "Seven impulsion moments create kamma. Afterwards there "
                    "is NO registration."
                ),
                "doctrinalNote": (
                    "After the 7 impulsions the mind drops straight back into "
                    "the life-continuum."
                ),
            },
            "9": {
                "name": "Post-process bhavaṅga",
                "description": (
                    "The life-continuum resumes after the process."
                ),
            },
        },
    },
    "VT_Y_MON": {
        "name": "Manodvāra-vīthi",
        "shortName": "Mind-door",
        "description": (
            "The mind-door process arises when the mind contacts a mind "
            "object through the mind door — thinking, remembering, "
            "imagining. Immediately after the mind-door adverting "
            "consciousness come the 7 impulsions."
        ),
        "arisingCondition": (
            "A mind object (dhammārammaṇa) appears at the mind door — a "
            "thought, a memory, an imagination."
        ),
        "significance": (
            "It explains all inner mental activity. It creates mind-kamma, "
            "and is the wellspring of verbal and bodily kamma."
        ),
        "doctrinalNote": (
            "The mind-door process begins with the mind-door adverting "
            "consciousness (CI_029), without passing through five-door "
            "adverting."
        ),
        "steps": {
            "1": {
                "name": "Vibrating bhavaṅga",
                "description": (
                    "The life-continuum vibrates as the mind object strikes."
                ),
            },
            "2": {
                "name": "Arrest bhavaṅga",
                "description": (
                    "The life-continuum is arrested — the mind-door process "
                    "begins."
                ),
            },
            "3": {
                "name": "Mind-door adverting",
                "description": (
                    "Opens the mind door and directs the mind to the mind "
                    "object, at the same time determining it (serving as "
                    "determining within this process)."
                ),
                "doctrinalNote": (
                    "CI_029 serves both as mind-door adverting and as "
                    "determining. 11 mental factors."
                ),
            },
            "4": {
                "name": "Impulsion (Javana)",
                "description": (
                    "Seven impulsion moments — creating mind-kamma. All "
                    "deliberate thought, speech, and action arise here."
                ),
                "doctrinalNote": (
                    "Creates mind-kamma directly. Verbal and bodily kamma "
                    "also begin at the mind door."
                ),
            },
            "5": {
                "name": "Registration (optional)",
                "description": (
                    "Registration in the mind-door process — depending on "
                    "the strength of the mind object."
                ),
            },
            "6": {
                "name": "Post-process bhavaṅga",
                "description": "The life-continuum resumes.",
            },
        },
    },
    "VT_VITHIMUTTA": {
        "name": "Vīthimutta-citta",
        "shortName": "Process-free",
        "description": (
            "Vīthimutta are consciousnesses operating outside the cognitive "
            "process — through no door at all. They have three functions: "
            "rebirth-linking (paṭisandhi), life-continuum (bhavaṅga), and "
            "death (cuti). All three use the same type of consciousness."
        ),
        "arisingCondition": (
            "Rebirth-linking: when the previous life ends. Life-continuum: "
            "between processes. Death: when the material life faculty "
            "perishes."
        ),
        "significance": (
            "It explains the mechanism of rebirth and the linkage between "
            "lives."
        ),
        "doctrinalNote": (
            "Process-free consciousness creates no new kamma — it is "
            "kammically indeterminate resultant mind."
        ),
        "steps": {
            "1": {
                "name": "Rebirth-linking consciousness",
                "description": (
                    "The first consciousness of the new life — continuing "
                    "directly from the previous life's dying consciousness, "
                    "carrying kamma's seed."
                ),
                "doctrinalNote": (
                    "CI_019/CI_026 = a two-rooted person; CI_027 = a "
                    "specially favoured person; CI_063–CI_070 = a "
                    "three-rooted person or a deva."
                ),
            },
            "2": {
                "name": "Life-continuum consciousness",
                "description": (
                    "The stream of consciousness that sustains the life "
                    "between processes. It arises and passes innumerable "
                    "times, and is the foundation of all mental activity."
                ),
                "doctrinalNote": (
                    "Bhavaṅga = the life-maintaining part of the stream. It "
                    "runs in deep sleep and between processes."
                ),
            },
            "3": {
                "name": "Death consciousness",
                "description": (
                    "The final mind-moment — the material life faculty "
                    "perishes, the death consciousness falls, and the life "
                    "ends. Immediately afterwards the next life's "
                    "rebirth-linking consciousness arises."
                ),
                "doctrinalNote": (
                    "Cuti = to move on, to depart. The object of the death "
                    "consciousness is the death-proximate (āsanna) object."
                ),
            },
        },
    },
}

# ── Assembly ─────────────────────────────────────────────────────────────────


def _clean(value: str | None) -> str | None:
    """Normalise whitespace; drop empties so the Dart side hides the row."""
    if value is None:
        return None
    collapsed = " ".join(value.split())
    return collapsed if collapsed else None


def build_paticcas(dataset: dict) -> dict:
    out = {}
    known = {item["id"] for item in dataset["paticcas"]}
    missing = sorted(known - set(PATICCAS))
    if missing:
        raise SystemExit(
            "build failed: paticcas missing English entries for "
            f"{', '.join(missing)} - English must cover every link so the "
            "fallback never leaks Vietnamese"
        )
    for item_id, authored in PATICCAS.items():
        if item_id not in known:
            raise SystemExit(f"build failed: paticcas.{item_id} is not in assets/data")
        entry = {}
        for field, value in authored.items():
            if field == "examples":
                entry[field] = [_clean(v) for v in value if _clean(v)]
            else:
                cleaned = _clean(value)
                if cleaned is not None:
                    entry[field] = cleaned
        out[item_id] = entry
    return out


def build_paccayas(dataset: dict) -> dict:
    by_id = {item["id"]: item for item in dataset["paccayas"]}
    missing = sorted(set(by_id) - set(PACCAYAS))
    if missing:
        raise SystemExit(
            "build failed: paccayas missing English entries for "
            f"{', '.join(missing)} - English must cover every condition so the "
            "fallback never leaks Vietnamese"
        )
    out = {}
    for item_id, authored in PACCAYAS.items():
        source = by_id.get(item_id)
        if source is None:
            raise SystemExit(f"build failed: paccayas.{item_id} is not in assets/data")
        entry = {}
        for field, value in authored.items():
            if field == "subdivisions":
                # Keyed by the dataset's Pāḷi name so the ids cannot drift.
                source_pali = [sub["namePali"] for sub in source.get("subdivisions", [])]
                missing_subs = sorted(set(source_pali) - set(value))
                if missing_subs:
                    raise SystemExit(
                        f"build failed: paccayas.{item_id} subdivisions not "
                        f"translated: {', '.join(missing_subs)}"
                    )
                entry[field] = {}
                for pali, translated in value.items():
                    if pali not in source_pali:
                        raise SystemExit(
                            f"build failed: paccayas.{item_id} has no subdivision "
                            f"{pali!r} in assets/data (found {source_pali})"
                        )
                    entry[field][pali] = {
                        "name": _clean(translated[0]),
                        "note": _clean(translated[1]),
                    }
            elif field == "examples":
                entry[field] = [_clean(v) for v in value if _clean(v)]
            else:
                cleaned = _clean(value)
                if cleaned is not None:
                    entry[field] = cleaned
        out[item_id] = entry
    return out


def build_vithis(dataset: dict) -> dict:
    out = {}
    known = {item["id"]: item for item in dataset["vithis"]}
    missing_ids = sorted(set(known) - set(VITHIS))
    if missing_ids:
        raise SystemExit(
            "build failed: vithis missing English entries for "
            f"{', '.join(missing_ids)} - English must cover every process so "
            "the fallback never leaks Vietnamese"
        )
    for item_id, authored in VITHIS.items():
        source = known.get(item_id)
        if source is None:
            raise SystemExit(f"build failed: vithis.{item_id} is not in assets/data")
        steps_out = {}
        source_numbers = {str(s["stepNumber"]) for s in source.get("steps", [])}
        missing_steps = sorted(source_numbers - set(authored["steps"]))
        if missing_steps:
            raise SystemExit(
                f"build failed: vithis.{item_id} steps not translated: "
                f"{', '.join(missing_steps)}"
            )
        for number, step in authored["steps"].items():
            if number not in source_numbers:
                raise SystemExit(
                    f"build failed: vithis.{item_id} has no step {number} in assets/data"
                )
            entry = {}
            for field, value in step.items():
                cleaned = _clean(value)
                if cleaned is not None:
                    entry[field] = cleaned
            steps_out[number] = entry
        entry_out = {}
        for field, value in authored.items():
            if field == "steps":
                continue
            cleaned = _clean(value)
            if cleaned is not None:
                entry_out[field] = cleaned
        entry_out["steps"] = steps_out
        out[item_id] = entry_out
    return out


def merge(existing: dict) -> dict:
    """Return the updated overlay: only the two repaired sections change."""
    out = dict(existing)
    paticca_dataset = _read_json(os.path.join(DATA, "paticca.json"))
    paccaya_dataset = _read_json(os.path.join(DATA, "paccayas.json"))
    vithi_dataset = _read_json(os.path.join(DATA, "vithis.json"))
    out["paticcas"] = build_paticcas(paticca_dataset)
    out["paccayas"] = build_paccayas(paccaya_dataset)
    out["vithis"] = build_vithis(vithi_dataset)
    return out


def _read_json(path: str) -> dict:
    with open(path, encoding="utf-8") as handle:
        return json.load(handle)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="verify content_en.json is up to date without writing",
    )
    args = parser.parse_args()

    with open(EN_PATH, encoding="utf-8") as handle:
        existing = json.load(handle)

    updated = merge(existing)
    if args.check:
        if existing.get("paccayas") == updated["paccayas"] and \
                existing.get("paticcas") == updated["paticcas"] and \
                existing.get("vithis") == updated["vithis"]:
            print("content_en.json is up to date")
            return 0
        print("content_en.json is stale — run tool/content/build_english_entities.py",
              file=sys.stderr)
        return 1

    with open(EN_PATH, "w", encoding="utf-8") as handle:
        json.dump(updated, handle, ensure_ascii=False, indent=2)
        handle.write("\n")
    counts = {k: len(v) for k, v in updated["paccayas"].items()}
    print(f"Wrote {EN_PATH}")
    print(f"  paticcas: {len(updated['paticcas'])} · paccayas: {len(updated['paccayas'])}"
          f" · vithis: {len(updated['vithis'])}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
