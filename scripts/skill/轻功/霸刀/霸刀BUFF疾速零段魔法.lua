---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/�Ե�/�Ե�BUFF�������ħ��.lua
-- ����ʱ��:	2016/10/5 16:36:45
-- �����û�:	zhangyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.AddBuff(0, 99, 11338, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com