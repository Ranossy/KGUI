--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local nBuff_ID = 2082
	local nBuff_Level = 1
	local player = GetPlayer(dwCharacterID)
	--local scene = player.GetScene()
	--local nCount = scene.GetCustomInteger1(15)																--取得创建NPC数量
	if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
		local nCount = scene.GetCustomInteger1(15)
		local nBuff = 0
		if nCount >= 1 then
			for i = 1, nCount do
				if scene.GetNpcByNickName("Thr_sword_" .. i) then											--如果之前的NPC存在就buff层数+1
					nBuff = nBuff + 1
				end
			end
		end
		nCount = nCount + 1																					--创建一个新的NPC
		scene.CreateNpc(7671,player.nX,player.nY,player.nZ,0,9999, "Thr_sword_" .. nCount)
		scene.SetCustomInteger1(15, nCount)
		for i = 1, nCount do																				--加buff
			local npc = scene.GetNpcByNickName("Thr_sword_" .. i)
			if npc then
				npc.DelBuff(nBuff_ID, nBuff_Level)
				for i = 1, nBuff do			
					npc.AddBuff(0, 99, nBuff_ID, nBuff_Level)
				end
			end
		end
		player.Die()
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com