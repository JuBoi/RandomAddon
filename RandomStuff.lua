SLASH_RELOADUI1 = "/rl" -- For quicker reloading
SlashCmdList.RELOADUI = ReloadUI

----------------------------------------------------------------
local directory = "Interface\\Addons\\RandomStuff\\Sounds\\";

local sounds = {
	
	death = { 
				"MarioDeath.ogg",
			},

	spells = { 
				"MoveBitch.ogg", 
				"BurnBabyBurn.ogg",
				"LaserGun.ogg",
				"smb_bump.ogg",
			 },
}

function Sound_Play(wat, potato)
	PlaySoundFile(directory..sounds[wat][potato]);
end

local frame = CreateFrame("FRAME")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
frame:SetScript("OnEvent", function(self, event, ...)

	local timestamp, combatevent, hideCaster, sourceGUID, sourceName, 
		sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, 
		destRaidFlags = CombatLogGetCurrentEventInfo()

	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then

		if (combatevent == "UNIT_DIED") then
			local recapID, unconsciousOnDeath = select(12, ...)
			if(destGUID == "Player-3676-06F45848") then
				Sound_Play("death", 1)
			end
		end

		if (combatevent == "SPELL_DAMAGE") then

			local spellId, spellName, spellSchool, amount, 
			overkill, school, resisted, blocked, absorbed, 
			critical = select(12, CombatLogGetCurrentEventInfo())
			if((spellId == 116858) and (sourceGUID == "Player-3676-06F45848")) then
				-- print("CHAOS BOLT");
				Sound_Play("spells", 2)
			end
		end
	end
end);
