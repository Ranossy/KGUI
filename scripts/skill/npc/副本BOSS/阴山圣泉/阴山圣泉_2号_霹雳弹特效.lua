---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ɽʥȪ/��ɽʥȪ_2��_��������Ч.lua
-- ����ʱ��:	2015/3/26 11:00:23
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	player.DoAction(0, 11032)
	scene.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/npc/����BOSS/��ɽʥȪ/��ɽʥȪ_2��_��������Ч.lua", dwCharacterID, 1)
end

function UnApply(dwCharacterID)
end

function OnTimer(scene, nParam1, nParam2)
	local player = GetPlayer(nParam1)
	if not player then
		return
	end
	
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	player.PlaySfx(1116, nX, nY, nZ)
	player.CastSkillXYZ(13854, 1, nX, nY, nZ)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com