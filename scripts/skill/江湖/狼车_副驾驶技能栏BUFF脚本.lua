---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�ǳ�_����ʻ������BUFF�ű�.lua
-- ����ʱ��:	2017/6/3 11:04:43
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local playerC = GetPlayer(player.dwControllerID)
	if playerC then--�п����ߣ�˵���Ǹ���ʻ
		if player.nGender == CHARACTER_GENDER.FEMALE then
			player.SetDynamicSkillGroup(346)
		end
		if player.nGender == CHARACTER_GENDER.MALE then
			player.SetDynamicSkillGroup(344)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com