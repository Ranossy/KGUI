---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��ׯ_���ݱ���.lua
-- ����ʱ��:	2014/5/28 15:20:42
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.nCurrentLife < npc.nMaxLife then
		npc.DelBuff(7866, 1)
		npc.FireAIEvent(2001, 0, 0)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com