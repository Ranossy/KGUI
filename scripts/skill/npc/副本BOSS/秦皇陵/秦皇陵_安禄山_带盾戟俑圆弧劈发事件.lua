---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_�����ٸԲ�������¼�.lua
-- ����ʱ��:	2014/1/23 14:53:00
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	npc.FireAIEvent(2003, 0, 0)
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com