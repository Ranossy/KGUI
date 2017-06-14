---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/璨翠海厅/1号_BUFF_水星瞄定.lua
-- 更新时间:	2015/6/4 0:35:21
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
			print(99999)
			scene.CreateNpc(43195, player.nX, player.nY, player.nZ, 0, 16 * 3);
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com