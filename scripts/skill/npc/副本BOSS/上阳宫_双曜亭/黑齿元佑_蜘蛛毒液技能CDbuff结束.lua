---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_˫��ͤ/�ڳ�Ԫ��_֩�붾Һ����CDbuff����.lua
-- ����ʱ��:	2016/3/31 14:29:56
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	
	npc.FireAIEvent(2001, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com