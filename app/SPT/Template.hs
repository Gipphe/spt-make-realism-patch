module SPT.Template
  (Template(..)
  ) where


data Template = MkTemplate {
  _id:: Text
  , _name:: Text
  , _parent :: Maybe Text
  , _props: Maybe Props,
  , _proto:: Maybe Text
  , _type:: Maybe Text
}

data Props = MkProps
  {
"Accuracy": 0,
"BaseMalfunctionChance": 0.1771,
"BlocksFolding": false,
"BoltAction": false,
"CameraSnap": 3.5,
"CameraToWeaponAngleSpeedRange": { "x": 0.1, "y": 0.2, "z": 0 },
"CameraToWeaponAngleStep": 0.1,
"CenterOfImpact": 0,
"ConflictingItems": [],
"CoolFactorGun": 3.168,
"CoolFactorGunMods": 1.072,
"Description": "sight_rear_all_sig_mpx_std",
"Description": "weapon_izhmash_rpk16_545x39",
"DoubleActionAccuracyPenalty": 1.5,
"DoubleActionAccuracyPenaltyMult": 1,
"Durability": 100,
"DurabilityBurnRatio": 1.15,
"EffectiveDistance": 0,
"Ergonomics": 0,
"Ergonomics": 29,
"ExamineExperience": 10,
"ExamineExperience": 2,
"ExamineTime": 1,
"ExamineTime": 1,
"ExaminedByDefault": true,
"ExaminedByDefault": true,
"ExtraSizeDown": 0,
"ExtraSizeDown": 0,
"ExtraSizeForceAdd": false,
"ExtraSizeForceAdd": false,
"ExtraSizeLeft": 0,
"ExtraSizeLeft": 0,
"ExtraSizeRight": 0,
"ExtraSizeRight": 0,
"ExtraSizeUp": 0,
"ExtraSizeUp": 0,
"Foldable": false,
"FoldedSlot": "",
"ForbidMissingVitalParts": false,
"ForbidMissingVitalParts": false,
"ForbidNonEmptyContainers": false,
"ForbidNonEmptyContainers": false,
"Grids": [],
"Grids": [],
"HasShoulderContact": false,
"HeatFactorByShot": 1.1,
"HeatFactorGun": 0.965,
"Height": 1,
"Height": 1,
"HideEntrails": false,
"HideEntrails": false,
"HipAccuracyRestorationDelay": 0.2,
"HipAccuracyRestorationSpeed": 7,
"HipInnaccuracyGain": 0.16,
"InsuranceDisabled": false,
"InsuranceDisabled": false,
"IronSightRange": 100,
"IsAdjustableOptic": false,
"IsAlwaysAvailableForInsurance": false,
"IsAlwaysAvailableForInsurance": false,
"IsAnimated": false,
"IsBeltMachineGun": true,
"IsFlareGun": false,
"IsGrenadeLauncher": false,
"IsLockedafterEquip": false,
"IsLockedafterEquip": false,
"IsOneoff": false,
"IsSpecialSlotOnly": false,
"IsSpecialSlotOnly": false,
"IsStationaryWeapon": false,
"IsUnbuyable": false,
"IsUnbuyable": false,
"IsUndiscardable": false,
"IsUndiscardable": false,
"IsUngivable": false,
"IsUngivable": false,
"IsUnremovable": false,
"IsUnremovable": false,
"IsUnsaleable": false,
"IsUnsaleable": false,
"ItemSound": "mod",
"ItemSound": "weap_ar",
"LootExperience": 10,
"LootExperience": 5,
"Loudness": 0,
"ManualBoltCatch": false,
"MaxDurability": 100,
"MaxRepairDegradation": 0.04,
"MaxRepairKitDegradation": 0.035,
"MergesWithChildren": true,
"MergesWithChildren": true,
"MinMaxFov": { "x": 0, "y": 0, "z": 0 },
"MinRepairDegradation": 0,
"MinRepairKitDegradation": 0,
"ModesCount": [ 1 ],
"MountCameraSnapMultiplier": 3,
"MountHorizontalRecoilMultiplier": 0.6,
"MountReturnSpeedHandMultiplier": 1,
"MountVerticalRecoilMultiplier": 0.85,
"MountingHorizontalOutOfBreathMultiplier": 0.4,
"MountingPosition": { "x": 0, "y": 0, "z": 0 },
"MountingVerticalOutOfBreathMultiplier": 0.8,
"MustBoltBeOpennedForExternalReload": false,
"MustBoltBeOpennedForInternalReload": false,
"Name": "sight_rear_all_sig_mpx_std",
"Name": "weapon_izhmash_rpk16_545x39",
"NoFiremodeOnBoltcatch": false,
"NotShownInSlot": false,
"NotShownInSlot": false,
"OperatingResource": 9000,
"PostRecoilHorizontalRangeHandRotation": { "x": -2.4, "y": 2.4, "z": 0 },
"PostRecoilVerticalRangeHandRotation": { "x": -2, "y": 0, "z": 0 },
"Prefab": { "path": "M60/sight_rear_m60_usord_m60_std.bundle", "rcid": "" },
"Prefab": { "path": "M60/weapon_usord_m60e4_v1_762x51_container.bundle", "rcid": "" },
"ProgressRecoilAngleOnStable": { "x": 0, "y": 27, "z": 0 },
"QuestItem": false,
"QuestItem": false,
"QuestStashMaxCount": 0,
"QuestStashMaxCount": 0,
"RagFairCommissionModifier": 1,
"RagFairCommissionModifier": 1,
"RaidModdable": true,
"RarityPvE": "Not_exist",
"RarityPvE": "Superrare",
"Recoil": 0,
"RecoilAngle": 90,
"RecoilCamera": 0.054,
"RecoilCategoryMultiplierHandRotation": 0.207,
"RecoilCenter": { "x": 0, "y": -0.25, "z": 0 },
"RecoilDampingHandRotation": 0.85,
"RecoilForceBack": 502,
"RecoilForceUp": 107,
"RecoilPosZMult": 1,
"RecoilReturnPathDampingHandRotation": 0.55,
"RecoilReturnPathOffsetHandRotation": 0.015,
"RecoilReturnSpeedHandRotation": 2.2,
"RecoilStableAngleIncreaseStep": 2.6,
"RecoilStableIndexShot": 5,
"RecolDispersion": 10,
"ReloadMode": "ExternalMagazine",
"RepairComplexity": 0,
"RepairCost": 0,
"RepairCost": 205,
"RepairSpeed": 0,
"RepairSpeed": 5,
"Retractable": false,
"RotationCenter": { "x": 0, "y": -0.1, "z": -0.03 },
"RotationCenterNoStock": { "x": 0, "y": -0.27, "z": -0.08 },
"ScopesCount": 1,
"ShortName": "sight_rear_all_sig_mpx_std",
"ShortName": "weapon_izhmash_rpk16_545x39",
"ShotsGroupSettings": [ { "EndShotIndex": 200, "ShotRecoilPositionStrength": { "x": 0, "y": 0, "z": 0 }, "ShotRecoilRadianRange": { "x": 6, "y": -6, "z": 0 }, "ShotRecoilRotationStrength": { "x": 0, "y": 0, "z": 0 }, "StartShotIndex": 1 } ],
"SightingRange": 100,
"SightingRange": 1100,
"SingleFireRate": 550,
"SizeReduceRight": 0,
"Slots": [ { "_id": "65fb023261d5829b2d090756", "_mergeSlotWithChildren": false, "_name": "mod_magazine", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "AnimationIndex": -1, "Filter": [ "660ea4453786cc0af808a1be" ] } ] }, "_proto": "55d30c394bdc2dae468b4577", "_required": false }, { "_id": "65fb023261d5829b2d090757", "_mergeSlotWithChildren": false, "_name": "mod_stock", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "660126161347bc1a5f0f4dba", "6615202b96461aa8360271eb", "661520fb6f8e1a96340afaa6" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": true }, { "_id": "65fb023261d5829b2d090758", "_mergeSlotWithChildren": false, "_name": "mod_barrel", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "6601279cc752a02bbe05e692", "66012788c752a02bbe05e68e", "660126f7c752a02bbe05e688", "66225d88a1c7e3b81600c76f" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": true }, { "_id": "65fb023261d5829b2d090759", "_mergeSlotWithChildren": false, "_name": "mod_handguard", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "66012d64c752a02bbe05e69b", "66012d003dff5074ed002e2c", "661fbe066751ee51930b01f2" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": true }, { "_id": "65fb023261d5829b2d09075a", "_mergeSlotWithChildren": false, "_name": "mod_sight_rear", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "6601265f98a610c1aa0ea637" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": false }, { "_id": "65fb045261d5829b2d0908ff", "_mergeSlotWithChildren": false, "_name": "mod_pistolgrip_000", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "6601257f1347bc1a5f0f4db6", "6615208aa031cbb5570e346a", "66152153a031cbb5570e346f" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": true }, { "_id": "65fb045261d5829b2d090900", "_mergeSlotWithChildren": false, "_name": "mod_bipod", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "66012d9a3dff5074ed002e33" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": false }, { "_id": "65fb04a125679d933f00d007", "_mergeSlotWithChildren": false, "_name": "mod_scope", "_parent": "65fb023261d5829b2d090755", "_props": { "filters": [ { "Filter": [ "57ac965c24597706be5f975c", "57aca93d2459771f2c7e26db", "544a3f024bdc2d1d388b4568", "544a3a774bdc2d3a388b4567", "5d2dc3e548f035404a1a4798", "57adff4f24597737f373b6e6", "5c0517910db83400232ffee5", "591c4efa86f7741030027726", "570fd79bd2720bc7458b4583", "570fd6c2d2720bc6458b457f", "558022b54bdc2dac148b458d", "5c07dd120db834001c39092d", "5c0a2cec0db834001b7ce47d", "58491f3324597764bc48fa02", "584924ec24597768f12ae244", "5b30b0dc5acfc400153b7124", "6165ac8c290d254f5e6b2f6c", "60a23797a37c940de7062d02", "5d2da1e948f035477b1ce2ba", "5c0505e00db834001b735073", "609a63b6e2ff132951242d09", "584984812459776a704a82a6", "59f9d81586f7744c7506ee62", "570fd721d2720bc5458b4596", "57ae0171245977343c27bfcf", "5d1b5e94d7ad1a2b865a96b0", "609bab8b455afd752b2e6138", "58d39d3d86f77445bb794ae7", "616554fe50224f204c1da2aa", "5c7d55f52e221644f31bff6a", "616584766ef05c2ce828ef57", "5b3b6dc75acfc47a8773fb1e", "615d8d878004cc50514c3233", "577d128124597739d65d0e56", "5c064c400db834001d23f468", "58d2664f86f7747fec5834f6", "5c1cdd302e221602b3137250", "61714b2467085e45ef140b2c", "5b31163c5acfc400153b71cb", "5a33b652c4a28232996e407c", "5a33b2c9c4a282000c5a9511", "59db7eed86f77461f8380365", "5a1ead28fcdbcb001912fa9f", "626bb8532c923541184624b4", "63fc449f5bd61c6cf3784a88", "6477772ea8a38bb2050ed4db", "6478641c19d732620e045e17", "64785e7c19d732620e045e15", "65392f611406374f82152ba5", "653931da5db71d30ab1d6296", "655f13e0a246670fb0373245", "62811f461d5df4475f46a332", "5b2389515acfc4771e1be0c0", "618b9643526131765025ab35", "618bab21526131765025ab3f", "5a37ca54c4a282000d72296a", "57c69dd424597774c03b7bbc", "5b3b99265acfc4704b4a1afb", "5aa66a9be5b5b0214e506e89", "5aa66c72e5b5b00016327c93", "6171407e50224f204c1da3c5", "61713cc4d8e3106d9806c109", "6567e751a715f85433025998", "5dff77c759400025ea5150cf", "5c86592b2e2216000e69e77c" ], "Shift": 0 } ] }, "_proto": "55d30c4c4bdc2db4468b457e", "_required": false } ],
"Slots": [],
"StackMaxSize": 1,
"StackMaxSize": 1,
"StackObjectsCount": 1,
"StackObjectsCount": 1,
"TacticalReloadFixation": 0.95,
"TacticalReloadStiffnes": { "x": 0.95, "y": 0.33, "z": 0.95 },
"ToolModdable": false,
"UniqueAnimationModID": 0,
"Unlootable": false,
"Unlootable": false,
"UnlootableFromSide": [],
"UnlootableFromSide": [],
"UnlootableFromSlot": "FirstPrimaryWeapon",
"UnlootableFromSlot": "FirstPrimaryWeapon",
"UsePrefab": { "path": "", "rcid": "" },
"UsePrefab": { "path": "", "rcid": "" },
"Velocity": 0,
"Velocity": 1.8,
"Weight": 0.092,
"Weight": 5.763,
"Width": 1,
"Width": 3,
"WithAnimatorAiming": false,
"ZoomSensitivity": 0,
"Zooms": [ [ 1 ] ],
"ammoCaliber": "Caliber762x51",
"bEffDist": 800,
"bFirerate": 550,
"bHearDist": 80,
"blockLeftStance": false,
"chamberAmmoCount": 1,
"defAmmo": "58dd3ad986f77403051cba8f",
"defMagType": "660ea4453786cc0af808a1be",
"durabSpawnMax": 75,
"durabSpawnMin": 25,
"isBoltCatch": false,
"isChamberLoad": true,
"isFastReload": true,
"shotgunDispersion": 0,
"sightModType": "iron"
"weapClass": "machinegun",
"weapFireType": [ "fullauto" ],
"weapUseType": "primary"
  }
