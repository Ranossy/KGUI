function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then 
		local player = GetPlayer(dwCharacterID)
		player.AddBuff(0,99,4215,1)				-- 20000的外功伤害 对自身
	else
		local npc = GetNpc(dwCharacterID)
		npc.AddBuff(0,99,4215,1)				-- 20000的外功伤害 对自身
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com