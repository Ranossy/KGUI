---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ʋʵ��ɾ��ж�buff.lua
-- ����ʱ��:	2014/11/17 19:49:52
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.nCurrentLife < npc.nMaxLife * 0.95 then
		if npc.GetBuff(8636, 1) then
			npc.DelBuff(8636, 1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com