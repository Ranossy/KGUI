---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/���ｫ_׼����.lua
-- ����ʱ��:	2014/9/4 16:12:16
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local boss = GetNpc(nCharacterID)
	if not boss then
		return
	end

	if nLeftFrame == 0 then
		boss.AddBuff(0, 99, 8202, 1)
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com