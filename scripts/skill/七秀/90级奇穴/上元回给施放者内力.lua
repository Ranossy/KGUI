---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�������������.lua
-- ����ʱ��:	2013/5/1 10:10:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--ʩ����
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--Ŀ��
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	
	if not target then
		return
	end
	if player.GetSkillLevel(5872) == 1 then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.03
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com