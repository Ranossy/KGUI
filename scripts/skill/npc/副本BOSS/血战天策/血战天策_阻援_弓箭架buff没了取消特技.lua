---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_��Ԯ_������buffû��ȡ���ؼ�.lua
-- ����ʱ��:	2013/10/24 16:26:24
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	player.SetDynamicSkillGroup(0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com