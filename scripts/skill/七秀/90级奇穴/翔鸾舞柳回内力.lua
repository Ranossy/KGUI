---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�������������.lua
-- ����ʱ��:	2013/5/1 10:10:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--���ϵĽű�
	return
	--[[
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if player.GetSkillLevel(5872) == 1 then
			target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.01
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com