function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		npc.CastSkill(2184,2)  
		npc.CastSkill(2087,1)
	end
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com