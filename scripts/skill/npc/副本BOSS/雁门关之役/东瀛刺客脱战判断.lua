---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/��孴̿���ս�ж�.lua
-- ����ʱ��:	2014/10/21 16:24:54
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.bFightState == false then
		npc.FireAIEvent(2003, 0, 0)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com