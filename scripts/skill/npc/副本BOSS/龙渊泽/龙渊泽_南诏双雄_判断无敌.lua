---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/��������.lua
-- ����ʱ��:	12/01/10 16:41:58
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
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

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com