--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		local scene = npc.GetScene()
		if scene then
			local Lv = 1
			if scene.dwMapID == 118 then
				Lv = 2
			elseif scene.dwMapID == 119 then
				Lv = 3
			elseif scene.dwMapID == 117 then
				Lv = 4
			end
			local npcBoss_Man = scene.GetNpcByNickName("Boss_1_Man")
			local npcBoss_Woman = scene.GetNpcByNickName("Boss_1_Woman")
			local nHpWoman = npcBoss_Woman.nCurrentLife / npcBoss_Woman.nMaxLife * 100
			if npcBoss_Man then
				local nHp = npcBoss_Man.nCurrentLife / npcBoss_Man.nMaxLife * 100
				if nHp <= 20 then
					local tBuff = npcBoss_Woman.GetBuff(2639, Lv)
					if not tBuff then
						npcBoss_Woman.AddBuff(0, 99, 2639, Lv)
					end
					if nHpWoman >= 80 and Lv ~= 1 then
						npcBoss_Woman.DelBuff(2987, 2)
						npcBoss_Woman.DelBuff(2987, 3)
						npcBoss_Woman.AddBuff(0, 99, 2987, 1)
					elseif nHpWoman >= 60 and Lv ~= 1 then
						npcBoss_Woman.DelBuff(2987, 1)
						npcBoss_Woman.DelBuff(2987, 3)
						npcBoss_Woman.AddBuff(0, 99, 2987, 2)
					elseif nHpWoman >= 40 and Lv ~= 1 then
						npcBoss_Woman.DelBuff(2987, 1)
						npcBoss_Woman.DelBuff(2987, 2)
						npcBoss_Woman.AddBuff(0, 99, 2987, 3)
					end
				else
					npcBoss_Woman.DelBuff(2639, Lv)
				end
			else
				local tBuff = npcBoss_Woman.GetBuff(2639, Lv)
				if not tBuff then
					npcBoss_Woman.AddBuff(0, 99, 2639, Lv)
				end
				if nHpWoman >= 60 and Lv ~= 1 then
					npcBoss_Woman.DelBuff(2987, 2)
					npcBoss_Woman.DelBuff(2987, 3)
					npcBoss_Woman.AddBuff(0, 99, 2987, 1)
				elseif nHpWoman >= 40 and Lv ~= 1 then
					npcBoss_Woman.DelBuff(2987, 1)
					npcBoss_Woman.DelBuff(2987, 3)
					npcBoss_Woman.AddBuff(0, 99, 2987, 2)
				elseif nHpWoman >= 20 and Lv ~= 1 then
					npcBoss_Woman.DelBuff(2987, 1)
					npcBoss_Woman.DelBuff(2987, 2)
					npcBoss_Woman.AddBuff(0, 99, 2987, 3)
				else
					npcBoss_Woman.DelBuff(2987, 1)
					npcBoss_Woman.DelBuff(2987, 2)
					npcBoss_Woman.DelBuff(2987, 3)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com