---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/��ת�ɹ������ж�.lua
-- ����ʱ��:	2013/6/5 5:49:24
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	local player = GetPlayer(dwSkillSrcID)
	if IsPlayer(dwCharacterID)  then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	if target.nMoveState == 19 then
		--player.AddBuff(dwSkillSrcID, player.nLevel, 8620, 1, 1)
		--player.AddBuff(dwSkillSrcID, player.nLevel, 8620, 1, 1)
		player.AddBuff(dwSkillSrcID, player.nLevel, 11261, 1, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com