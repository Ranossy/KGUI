--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
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
			if npcBoss_Woman then
				local nHp = npcBoss_Woman.nCurrentLife / npcBoss_Woman.nMaxLife * 100
				if nHp <= 20 then
					npcBoss_Man.AddBuff(0, 99, 2635, Lv)
				else
					npcBoss_Man.DelBuff(2635, Lv)
				end
			else
				npcBoss_Man.AddBuff(0, 99, 2635, Lv)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com