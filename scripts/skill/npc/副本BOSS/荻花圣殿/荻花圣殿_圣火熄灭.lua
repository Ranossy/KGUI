function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
		local CPlayer = GetPlayer(tPlayer[i])
			if CPlayer then
				CPlayer.Die()
			end
		end
		local npcBoss1 = scene.GetNpcByNickName("mudan")
		if npcBoss1 and npcBoss1.bFightState then
			npcBoss1.Yell(GetEditorString(3, 9031))
			npcBoss1.DoAction(0, 10061)
		end
		local npcBoss2 = scene.GetNpcByNickName("taluomadi")
		if npcBoss2 and npcBoss2.bFightState then
			npcBoss2.Yell(GetEditorString(3, 9032))
			npcBoss2.DoAction(0, 10064)
		end
		local npcBoss3 = scene.GetNpcByNickName("MuRongZhuiFeng")
		if npcBoss3 and npcBoss3.bFightState then
			npcBoss3.Yell(GetEditorString(3, 9033))
			npcBoss3.DoAction(0, 10068)
		end
		local npcBoss4 = scene.GetNpcByNickName("WeiQiWu")
		if npcBoss4 and npcBoss4.bFightState then
			npcBoss4.Yell(GetEditorString(3, 9034))
			npcBoss4.DoAction(0, 10065)
		end
		local npcBoss6 = scene.GetNpcByNickName("asaxin")
		if npcBoss6 and npcBoss6.bFightState then
			npcBoss6.Yell(GetEditorString(3, 9035))
			npcBoss6.DoAction(0, 10066)
		end
		local npcBoss7 = scene.GetNpcByNickName("shaliya")
		if npcBoss7 and npcBoss7.bFightState then
			npcBoss7.Yell(GetEditorString(3, 9036))
			npcBoss7.DoAction(0, 10064)
		end
		local npcBoss8 = scene.GetNpcByNickName("murongfuren")
		if npcBoss8 and npcBoss8.bFightState then
			npcBoss8.Yell(GetEditorString(3, 9037))
			npcBoss8.DoAction(0, 10065)
		end
		local npcBoss91 = scene.GetNpcByNickName("xueying")
		if npcBoss91 and npcBoss91.bFightState then
			npcBoss91.Yell(GetEditorString(3, 9038))
			npcBoss91.DoAction(0, 10068)
		end
		local npcBoss92 = scene.GetNpcByNickName("gulang")
		if npcBoss92 and npcBoss92.bFightState then
			npcBoss92.Yell(GetEditorString(3, 9039))
			npcBoss92.DoAction(0, 10067)
		end
		local npcBoss93 = scene.GetNpcByNickName("manxiong")
		if npcBoss93 and npcBoss93.bFightState then
			npcBoss93.Yell(GetEditorString(3, 9040))
			npcBoss93.DoAction(0, 10063)
		end
	end
	
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com