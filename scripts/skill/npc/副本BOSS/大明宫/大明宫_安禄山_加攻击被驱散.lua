function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if npc.bFightState == true then
		if scene.dwMapID == 164 then
			npc.AddBuff(0, 99, 5518, 1)
		else
			npc.AddBuff(0, 99, 5518, 2)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com