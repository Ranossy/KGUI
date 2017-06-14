---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/���Ѽ��.lua
-- ����ʱ��:	2017/2/16 22:38:10
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local playerTarget = GetPlayer(dwCharacterID)
	local npcTarget = GetNpc(dwCharacterID)
	local npc = GetNpc(dwSkillSrcID)
	if playerTarget then
		if playerTarget.GetBuff(11710, 1) then
			local Nbuff = playerTarget.GetBuff(11710, 1)
			local Num = Nbuff.nStackNum
			if Num == 3 then
				playerTarget.DelGroupBuff(11710, 1)
				playerTarget.AddBuff(npc.dwID, npc.nLevel, 11712, 1)
			end
		end
	end		--������
	if npcTarget then
		if npcTarget.GetBuff(11710, 1) then
			local nbuff = npcTarget.GetBuff(11710, 1)
			local num = nbuff.nStackNum
			if num == 3 then
				npcTarget.DelGroupBuff(11710, 1)
				npcTarget.AddBuff(npc.dwID, npc.nLevel, 11712, 1)
			end
		end
	end
	if playerTarget then
		if playerTarget.GetBuff(11833, 1) then
			local Nbuff1 = playerTarget.GetBuff(11833, 1)
			local Num1 = Nbuff1.nStackNum
			if Num1 == 3 then
				playerTarget.DelGroupBuff(11833, 1)
				playerTarget.AddBuff(npc.dwID, npc.nLevel, 11712, 1)
			end
		end
	end		--������
	if npcTarget then
		if npcTarget.GetBuff(11833, 1) then
			local nbuff1 = npcTarget.GetBuff(11833, 1)
			local num1 = nbuff1.nStackNum
			if num1 == 3 then
				npcTarget.DelGroupBuff(11833, 1)
				npcTarget.AddBuff(npc.dwID, npc.nLevel, 11712, 1)
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com