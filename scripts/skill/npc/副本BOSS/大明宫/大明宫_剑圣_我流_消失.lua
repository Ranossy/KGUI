function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if nLeftFrame > 0 then
		if scene.dwMapID == 164 then
			npc.CastSkill(5567, 3)
		else
			npc.CastSkill(5567, 4)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com