---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���������ӹ���.lua
-- ����ʱ��:	2013/10/28 14:07:40
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
	if (not player.GetBuff(134, lv)) and (not player.GetBuff(6090, lv))and (not player.GetBuff(8867, lv))and (not player.GetBuff(8868, lv)) then
		player.DelBuff(2983,2)
	end
	--[[
	if player.GetSkillLevel(6460) == 1 then
		if player.nAccumulateValue == 10 then
			if (not player.GetBuff(6428, 1)) and player.nMoveState ~= 16 then
				player.AddBuff(dwCharacterID, player.nLevel, 6428, 1)
			end
		end
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com