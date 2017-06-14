---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/璨翠海厅/3号_阵序金.lua
-- 更新时间:	2015/5/31 20:32:57
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local buff = player.GetBuff(8901, 1)
	if buff then
		player.DelBuff(8901, 1)
	end
	
	local buff1 = player.GetBuff(8901, 2)
	if buff1 then
		player.DelBuff(8901, 2)
	end
end

function UnApply(dwCharacterID)
	--print(44444)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com