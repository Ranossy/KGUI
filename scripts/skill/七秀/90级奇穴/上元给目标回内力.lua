---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�������������.lua
-- ����ʱ��:	2013/5/1 10:10:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
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
		target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.0075
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com