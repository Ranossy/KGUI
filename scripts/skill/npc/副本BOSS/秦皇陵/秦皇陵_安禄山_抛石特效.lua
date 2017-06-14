---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_抛石特效.lua
-- 更新时间:	2014/2/19 10:11:05
-- 更新用户:	ks13376-PC
-- 脚本说明:	
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com