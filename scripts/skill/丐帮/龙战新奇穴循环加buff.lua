---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_ʩ��_ͻ.lua
-- ����ʱ��:	2013/4/17 20:45:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetSkillLevel(6821) == 1 then
		player.AddBuff(player.dwID,player.nLevel,7789,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com