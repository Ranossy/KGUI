---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_������Ѱ�׻�ɽ����ʱbuff.lua
-- ����ʱ��:	2016/6/8 16:31:22
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DoAction(0, 60122)
		player.DelBuff(8576, 1)
		player.DelBuff(10821, 1)
		player.DelBuff(10823, 1)
		player.DelBuff(10824, 1)
		player.DelBuff(10825, 1)
		player.SetDynamicSkillGroup(0)
		if player.nCurrentRage < player.nMaxRage * 0.2 then
			player.CastSkill(15995, 1)
			player.nCurrentRage = 0
		end

		if player.nCurrentRage >= player.nMaxRage * 0.2 and player.nCurrentRage < player.nMaxRage * 0.4 then
			player.CastSkill(15995, 2)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.2
		end

		if player.nCurrentRage >= player.nMaxRage * 0.4 and player.nCurrentRage < player.nMaxRage * 0.6 then
			player.CastSkill(15995, 3)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.4
		end

		if player.nCurrentRage >= player.nMaxRage * 0.6 and player.nCurrentRage < player.nMaxRage * 0.8 then
			player.CastSkill(15995, 4)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.6
		end

		if player.nCurrentRage >= player.nMaxRage * 0.8 and player.nCurrentRage < player.nMaxRage * 1 then
			player.CastSkill(15995, 5)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.8
		end

		if player.nCurrentRage == player.nMaxRage then
			player.CastSkill(15995, 6)
			player.nCurrentRage = player.nCurrentRage - 100
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com