---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/���ϼ��˺�.lua
-- ����ʱ��:	2013/4/25 17:13:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(5925) == 1 then
		if player.IsSkillRecipeActive(257, 1) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 5708, 1, 18)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 5708, 1, 12)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com