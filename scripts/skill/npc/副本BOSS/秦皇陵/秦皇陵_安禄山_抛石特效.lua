---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_��ʯ��Ч.lua
-- ����ʱ��:	2014/2/19 10:11:05
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	player.PlaySfx(571, nX, nY, nZ)
	player.CastSkill(8859, 1)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com