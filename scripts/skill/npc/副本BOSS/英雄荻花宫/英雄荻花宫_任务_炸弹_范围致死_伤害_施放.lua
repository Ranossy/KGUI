function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then 
		local player = GetPlayer(dwCharacterID)
		player.CastSkill(899,1)					-- 20000���⹦�˺� ������
	else
		local npc = GetNpc(dwCharacterID)
		if npc.dwTemplateID == 5114 then
			npc.CastSkill(899,1)				-- 20000���⹦�˺� ������
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com