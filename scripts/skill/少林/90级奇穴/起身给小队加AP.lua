---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�����С�Ӽ�AP.lua
-- ����ʱ��:	2013/5/15 10:05:28
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(dwCharacterID,player.nLevel,7119,1,1)
	if player.GetSkillLevel(5908) == 1 then
		player.CastSkill(6149, 1)
		player.PlaySfx(484, player.nX, player.nY, player.nZ)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com