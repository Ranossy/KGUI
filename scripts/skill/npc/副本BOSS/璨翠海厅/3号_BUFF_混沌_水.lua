---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/璨翠海厅/3号_BUFF_混沌_水.lua
-- 更新时间:	2015/5/22 17:25:32
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local nBuff_5x_ID = 8903
	local nBuff_5x_lv = 1
	local nStackNum_5x = 5
	local nBuff_ZY_ID = 8964
	local nBuff_ZY_lv = 1
	
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 222 then
		nBuff_5x_lv = 2
	end
	
	local buff_zy = player.GetBuff(nBuff_ZY_ID, nBuff_ZY_lv)
	if buff_zy then
		return
	end
	local buff = player.GetBuff(nBuff_5x_ID, nBuff_5x_lv)
	if buff then
		if buff.nStackNum == nStackNum_5x then
			return
		end
	end
	local boss = scene.GetNpcByNickName("boss_GONGMING")
	if boss then
		player.AddBuff(boss.dwID, boss.nLevel, nBuff_5x_ID, nBuff_5x_lv)
	end	
	--player.AddBuff(0, 99, nBuff_5x_ID, nBuff_5x_lv)
end

function UnApply(dwCharacterID)
	--print(44444)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com