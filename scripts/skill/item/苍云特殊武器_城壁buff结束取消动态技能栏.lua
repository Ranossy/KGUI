---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_�Ǳ�buff����ȡ����̬������.lua
-- ����ʱ��:	2016/3/25 10:24:40
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.DoAction(0, 60124)
	player.SetDynamicSkillGroup(0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com