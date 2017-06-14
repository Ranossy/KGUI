---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_阻援_举石头buff没了取消特技.lua
-- 更新时间:	2013/10/24 16:46:42
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.FollowStop()
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com