--------------------------------------------------------------
-- Real Fixes
-- Author: Infixo
-- 2018-12-09: Separate file for R&F
--------------------------------------------------------------

-- 2018-03-25 Rise & Fall only (moved from the main file)
INSERT OR REPLACE INTO Types (Type, Kind) VALUES ('PSEUDOYIELD_GOLDENAGE_POINT', 'KIND_PSEUDOYIELD');
UPDATE AiFavoredItems SET Item = 'TECH_SAILING' WHERE Item = 'TECH_SALING'; -- GenghisTechs
DELETE FROM AiFavoredItems WHERE ListType = 'WilhelminaEmergencyAllianceList' AND Item = 'DIPLOACTION_ALLIANCE_MILITARY_EMERGENCY(NOT_IN_YET)'; -- WilhelminaEmergencyAllianceList, REMOVE IF IMPLEMENTED PROPERLY!
DELETE FROM AiFavoredItems WHERE ListType = 'IronConfederacyDiplomacy' AND Item = 'DIPLOACTION_ALLIANCE_TEAMUP'; -- IronConfederacyDiplomacy, does not exists in Diplo Actions, REMOVE IF IMPLEMENTED PROPERLY!

-- 2019-04-09 Gathering Storm
UPDATE AiFavoredItems SET Item = 'TECH_REPLACEABLE_PARTS' WHERE Item = 'TECH_REPLACABLE_PARTS'; -- PachacutiTechs
UPDATE AiFavoredItems SET Item = 'TECH_GUNPOWDER' WHERE Item = 'TECH_GUNPOWER'; -- SuliemanTechs
-- 2023-03-29 Lol... they repeated the same error for Alt Suleiman :) copy & paste...

-- below are used by Poundmaker Iron Confederacy; why robert bruce (taken from AGENDA_FLOWER_OF_SCOTLAND_WAR_NEIGHBORS)
--AGENDA_IRON_CONFEDERACY_FEW_ALLIANCES	StatementKey	ARGTYPE_IDENTITY	LOC_DIPLO_WARNING_LEADER_ROBERT_THE_BRUCE_REASON_ANY
--AGENDA_IRON_CONFEDERACY_MANY_ALLIANCES	StatementKey	ARGTYPE_IDENTITY	LOC_DIPLO_WARNING_LEADER_ROBERT_THE_BRUCE_REASON_ANY


--------------------------------------------------------------
-- 2020-07-05 War-Carts don't get Alpine Training from Matterhorn
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES ('ABILITY_ALPINE_TRAINING', 'CLASS_HEAVY_CHARIOT'); -- 2023-03-29 use of more generic Class Tag
-- 2020-07-05 Warrior Monks also don't get Alpine Training from Matterhorn despite the fact that they are a land combat unit
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES ('ABILITY_ALPINE_TRAINING', 'CLASS_WARRIOR_MONK'); -- 2023-03-29 use of more generic Class Tag


--------------------------------------------------------------
-- BALANCE SECTION


--------------------------------------------------------------
-- AI

-- Fixed with Gathering Storm Patch
-- 2020-05-29 Seems like the bug is back
--DELETE FROM GovernmentModifiers WHERE GovernmentType = 'GOVERNMENT_FASCISM' AND ModifierId = 'FASCISM_UNIT_PRODUCTION';


-- test
--UPDATE Resolutions SET AILuaTargetChooser = 'WC_Choose_BorderControl' WHERE ResolutionType = 'WC_RES_BORDER_CONTROL';
--UPDATE Resolutions SET AILuaTargetChooser = 'WC_Choose_YieldBan'      WHERE ResolutionType = 'WC_RES_MERCENARY_COMPANIES';
