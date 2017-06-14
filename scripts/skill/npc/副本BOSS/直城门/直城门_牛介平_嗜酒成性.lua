function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("BOSS1")
	if not npcBoss then
		return
	end
	if nLeftFrame > 0 then
		npcBoss.FireAIEvent(2020,0,0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com