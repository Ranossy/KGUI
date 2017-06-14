--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cNpc = GetNpc(dwCharacterID)
	if not cNpc then
		return
	end
	local scene = cNpc.GetScene()
 	if not scene then
 		return
 	end
	local npcSt1 = scene.GetNpcByNickName("dashe_1")
	if not npcSt1 then
		return
	end
	npcSt1.AddBuff(0,99,3481,1)
	local npcSt2 = scene.GetNpcByNickName("dashe_2")
	if not npcSt2 then
		return
	end
	npcSt2.AddBuff(0,99,3481,1)
	local npcSt3 = scene.GetNpcByNickName("dashe_3")
	if not npcSt3 then
		return
	end
	npcSt3.AddBuff(0,99,3481,1)
	local npcSt4 = scene.GetNpcByNickName("dashe_4")
	if not npcSt4 then
		return
	end
	npcSt4.AddBuff(0,99,3481,1)
	
	local npcYmy = scene.GetNpcByNickName("yuanmingya")
	if not npcYmy then
		return
	end
	npcYmy.Yell(GetEditorString(3, 9030))
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com