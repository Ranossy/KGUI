---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_ɽ��_����AOE.lua
-- ����ʱ��:	2013/9/24 15:31:26
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if scene.dwMapID == 175 then
		npc.CastSkill(8208, 1)
	end
	
	if scene.dwMapID == 176 then
		npc.CastSkill(8208, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com