function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if nLeftFrame == 0 then
		npc.CastSkill(5634,1)
	else
		npc.CastSkill(5635,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com