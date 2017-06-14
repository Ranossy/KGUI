---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/荻花宫后山/skill/最后的忍耐.lua
-- 更新时间:	12/01/10 16:41:58
-- 更新用户:	yule-PC
-- 脚本说明:	
----------------------------------------------------------------------<


-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID) 
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local npcBossA = scene.GetNpcByNickName("Boss_4_Assassin")
		local npcBossB = scene.GetNpcByNickName("Boss_4_Hero")
		if npcBossA and npcBossB then
			local HpA = npcBossA.nCurrentLife / npcBossA.nMaxLife
			local HpB = npcBossB.nCurrentLife / npcBossB.nMaxLife
			if (HpA - HpB) > 0.2 then
				npcBossB.AddBuff(0, 99, 3091, 1)
			end
			if (HpB - HpA) > 0.2 then
				npcBossA.AddBuff(0, 99, 3091, 1)
			end
		end
	end
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com