---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/雁门关之役_独孤问俗_沙暴buff.lua
-- 更新时间:	2014/10/29 14:21:14
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 195 then
		player.CastSkill(13281, 1)
	else
		player.CastSkill(13281, 2)
	end
	player.PlaySfx(497, player.nX, player.nY, player.nZ + 64)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com