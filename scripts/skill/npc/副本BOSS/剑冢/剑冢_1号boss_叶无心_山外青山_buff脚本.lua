function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if npc then
		if nLeftFrame == 0 then
			npc.CastSkill(1744, 1)
		else
			npc.AddBuff(0, 99, 1764, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com