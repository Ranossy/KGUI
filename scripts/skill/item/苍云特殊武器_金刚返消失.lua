---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_��շ���ʧ.lua
-- ����ʱ��:	2016/3/24 14:42:48
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end

	local Xueliang1 = npc.GetCustomInteger4(16)
	local Xueliang2 = npc.nCurrentLife
	local num = Xueliang1 - Xueliang2
	if num >= npc.nMaxLife * 0.01 then
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.01
		npc.CastSkill(15665, 1)
	end

	if num < npc.nMaxLife * 0.01 then
		npc.nCurrentLife = npc.nCurrentLife + num
		npc.CastSkill(15666, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com