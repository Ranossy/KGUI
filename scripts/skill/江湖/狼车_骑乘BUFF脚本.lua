---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_����BUFF�ű�.lua
-- ����ʱ��:	2015/3/29 18:43:05
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.nGender == CHARACTER_GENDER.FEMALE then
		player.SetDynamicSkillGroup(345)
	end
	if player.nGender == CHARACTER_GENDER.MALE then
		player.SetDynamicSkillGroup(343)
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