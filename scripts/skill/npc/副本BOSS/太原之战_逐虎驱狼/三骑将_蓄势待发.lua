---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/���ｫ_���ƴ���.lua
-- ����ʱ��:	2014/9/3 16:54:34
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local boss = GetNpc(nCharacterID)
	if not boss then
		return
	end

	if nLeftFrame == 0 then
	
		if boss.GetCustomInteger1(6) == 1 then
			boss.FireAIEvent(2006, 0, 0)      --�����л������
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com