function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		npc.CastSkill(2591,4)
	end
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com