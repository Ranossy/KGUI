---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ�_�߲ʷ糵ά��.lua
-- ����ʱ��:	2016/5/25 19:24:27
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.GetDynamicSkillGroup() == 259 then
		player.SetDynamicSkillGroup(0)	
	end
end
function OnRemove(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.GetDynamicSkillGroup() == 259 then
		player.SetDynamicSkillGroup(0)	
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com