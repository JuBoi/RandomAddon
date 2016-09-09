SLASH_RELOADUI1 = "/potato" -- For quicker reloading
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
	local timestamp, type, hideCaster, sourceGUID, sourceName, 
	sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, 
	destRaidFlags = ...

	if(event == "COMBAT_LOG_EVENT_UNFILTERED") then

		if(type == "UNIT_DIED") then
			local recapID, unconsciousOnDeath = select(12, ...)
			if(destGUID == "Player-3676-06F45848") then
				Sound_Play("death", 1)
			end
		end

		if(type == "SPELL_DAMAGE") then

			local spellId, spellName, spellSchool, amount, 
			overkill, school, resisted, blocked, absorbed, 
			critical, glancing, crushing = select(12, ...)

			if ((spellId == 215279) and (sourceFlags == 8465)) then 
				--print("CHAOS")
				Sound_Play("spells", 1)
			end
			--[[if(spellId == 116858) then
				print("REG CHAOS BOLT")
			end]]
			if((spellId == 348) or (sourceGUID == "Player-3676-06F45848")) then
				Sound_Play("spells", 2)
			end
			if((spellId == 187394) and (sourceFlags == 8465)) then

				Sound_Play("spells", 3)
			end

			if((spellId == 196657) and (sourceFlags == 8465)) then

				Sound_Play("spells", 4)
			end
		end
	end
end);
