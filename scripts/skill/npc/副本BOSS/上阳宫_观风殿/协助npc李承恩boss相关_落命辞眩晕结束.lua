---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/Э��npc��ж�boss���_������ѣ�ν���.lua
-- ����ʱ��:	2016/4/22 11:00:12
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	
	npc.Die()
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com