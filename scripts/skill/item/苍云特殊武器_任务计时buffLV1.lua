---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_�����ʱbuffLV1.lua
-- ����ʱ��:	2016/3/28 11:31:15
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
		npc.SetCustomBoolean(2, true)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com