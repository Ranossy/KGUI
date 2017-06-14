function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then 
		local player = GetPlayer(dwCharacterID)
		player.CastSkill(899,1)					-- 20000的外功伤害 对自身
	else
		local npc = GetNpc(dwCharacterID)
		if npc.dwTemplateID == 5114 then
			npc.CastSkill(899,1)				-- 20000的外功伤害 对自身
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com