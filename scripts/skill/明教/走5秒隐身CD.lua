------------------------------------------------
-- ������   :  ֣����	
-- ����ʱ��	:  20120613
-- Ч����ע	:  ���̼���
------------------------------------------------
Include("scripts/Include/Skill.lh")

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if not player.GetBuff(4913,1) and (not player.bFightState) then
		player.DelBuff(4908, 1)
		player.ResetCD(564)
		player.DelBuff(5496, 1)
		ModityCDToUI(player, 3974, 0, 0)
	end
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com