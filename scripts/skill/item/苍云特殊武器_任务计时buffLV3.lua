---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_�����ʱbuffLV3.lua
-- ����ʱ��:	2016/3/28 11:36:16
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local xiaoseng = scene.GetNpcByNickName("xiaoseng")
	if xiaoseng and xiaoseng.GetCustomBoolean(17) == false then
		npc.SetCustomBoolean(6, true)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com