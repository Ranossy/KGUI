---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������������.lua
-- ����ʱ��:	2013/6/21 23:55:29
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(312)
	if (not player.IsHaveBuff(134, lv)) and (not player.IsHaveBuff(6090, lv)) and (not player.IsHaveBuff(8867, lv))and (not player.IsHaveBuff(8868, lv))then
		player.DelBuff(2983,2)
	end
	if player.nAccumulateValue >= 10 then
		--if not player.GetBuff(6422,1) then
		player.AddBuff(dwCharacterID, player.nLevel, 6422, 1, 1)
		--end
	else
		player.DelBuff(6422, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com