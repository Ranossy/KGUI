---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/��������Ч.lua
-- ����ʱ��:	2013/10/30 11:01:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.PlaySfx(617, player.nX, player.nY, player.nZ + 600)
	--���������
	if player.GetSkillLevel(14862) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9874, 1)
	end
	
	--�̶�����������
	if player.GetSkillLevel(14867) == 1 then
		player.CastSkill(14897, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com