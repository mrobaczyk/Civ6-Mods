print("Loading TechTree_BTT_XP1.lua from Better Tech Tree version "..GlobalParameters.BTT_VERSION_MAJOR.."."..GlobalParameters.BTT_VERSION_MINOR);
-- ===========================================================================
-- Better Tech Tree
-- Author: Infixo
-- 2018-03-19: Created
-- ===========================================================================

local bIsCQUI:boolean = Modding.IsModActive("1d44b5e7-753e-405b-af24-5ee634ec8a01"); -- CQUI
print("CQUI:", (bIsCQUI and "YES" or "no"));

if bIsCQUI then
include("TechTree_CQUI");
else
include("TechTree_Expansion1");
end

BTT_XP1_LateInitialize = LateInitialize;

include("TechAndCivicSupport_BTT");

function LateInitialize()
    Initialize_TechsWithUniques();
	Initialize_BTT_TechTree(); -- we must call it BEFORE main LateInitialize because of AllocateUI being called there; all data must be ready before that
	BTT_XP1_LateInitialize();
    Initialize_BTT_Marking();
end


-- ===========================================================================
-- Support for Real Eurekas mod

-- Cache base functions
REU_XP1_PopulateNode = PopulateNode;

function PopulateNode(uiNode, playerTechData)
	REU_XP1_PopulateNode(uiNode, playerTechData);

    -- show/hide important mark
    PopulateNode_InitMark(uiNode);
    uiNode.MarkLabel:SetHide(not uiNode.IsMarked);
    
	if not bIsREU then return; end

	local item		:table = g_kItemDefaults[uiNode.Type];						-- static item data
	local live		:table = playerTechData[DATA_FIELD_LIVEDATA][uiNode.Type];	-- live (changing) data

	if item.IsBoostable and live.Status ~= ITEM_STATUS.RESEARCHED then
		local boostText:string;
		if CanShowTrigger(item.Index, false) then boostText = TXT_TO_BOOST.." "..item.BoostText;
		else boostText = GetRandomQuote(item.Index); end
		TruncateStringWithTooltip(uiNode.BoostText, MAX_BEFORE_TRUNC_TO_BOOST, boostText);
	end
end

print("OK Loaded TechTree_BTT_XP1.lua from Better Tech Tree");