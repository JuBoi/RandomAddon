SLASH_RELOADUI1 = "/rl" -- For quicker reloading
SlashCmdList.RELOADUI = ReloadUI

----------------------------------------------------------------
--[[local directory = "Interface\\Addons\\RandomStuff\\RandomSounds\\";

local sounds = {
	
	death = { "MarioDeath.ogg"},
}]]

--[[function Sound_Play(wat)
	PlaySoundFile(directory..sounds[wat][1]);
end]]


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
				PlaySoundFile("Interface\\Addons\\RandomStuff\\Sounds\\MarioDeath.ogg")
			end
		end

		if(type == "SPELL_DAMAGE") then

			local spellId, spellName, spellSchool, amount, 
			overkill, school, resisted, blocked, absorbed, 
			critical, glancing, crushing = select(12, ...)

			if (spellId == 215279) then 
				print("DR CHAOS BOLT")
				--PlaySoundFile("Interface\\Addons\\RandomStuff\\Sounds\\BurnBabyBurn.ogg");
			end
			if(spellId == 116858) then
				print("REG CHAOS BOLT")
			end
			if(spellId == 196586) then
				print("DRIFT")
			end
			if(spellId == 187394) then
				print("MACHINE GUN")
			end
			if(spellId == 196657) then
				print("SHADOW BOLTS")
			end
		end
	end
end);
