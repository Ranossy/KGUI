---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_���ǹ����н��.lua
-- ����ʱ��:	2013/7/18 17:46:36
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if target.nMoveState == 13 then
		if player.GetSkillLevel(5842) == 1 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6103, 1, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com