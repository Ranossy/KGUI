---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ɢ�����������.lua
-- ����ʱ��:	2013/6/4 4:58:35
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.DoAction(0, 10103)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 10044)
	player.AddBuff(0, 99, 4901, 1)	--������ʧ��3���ڰ���
	if player.GetSkillLevel(5986) == 1 then	--�������
		player.CastSkill(4072, 1)
	end
	
	--if player.GetSkillLevel(5984) == 1 then	--�������
		player.CastSkill(4072, 1)		--ֱ�Ӹ����
	--end

	--����ʿ״̬͸������ʾ
	if player.GetBuff(10827, 1) then
		player.AddBuff(player.dwID, player.nLevel, 11494, 1, 30)
	end	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com