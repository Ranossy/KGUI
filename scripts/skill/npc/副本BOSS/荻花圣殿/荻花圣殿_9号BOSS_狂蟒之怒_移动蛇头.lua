function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
 		return
 	end
 	local scene = npc.GetScene()
 	if not scene then
 		return
 	end
 	local npcSt1 = scene.GetNpcByNickName("shetou_1")
	local npcSt2 = scene.GetNpcByNickName("shetou_2")
	local npcSt3 = scene.GetNpcByNickName("shetou_3")
	local npcSt4 = scene.GetNpcByNickName("shetou_4")
	if npc.szName == "dashe_1" then
		npcSt1.FireAIEvent(2003,0,1)
	end

	if npc.szName == "dashe_2" then
		npcSt2.FireAIEvent(2003,0,1)
	end
	if npc.szName == "dashe_3" then
		npcSt3.FireAIEvent(2003,0,1)
	end
	if npc.szName == "dashe_4" then
		npcSt4.FireAIEvent(2003,0,1)
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com