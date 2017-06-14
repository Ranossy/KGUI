---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/阴山圣泉/阴山圣泉_2号_霹雳弹特效.lua
-- 更新时间:	2015/3/26 11:00:23
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	player.DoAction(0, 11032)
	scene.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/npc/副本BOSS/阴山圣泉/阴山圣泉_2号_霹雳弹特效.lua", dwCharacterID, 1)
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com