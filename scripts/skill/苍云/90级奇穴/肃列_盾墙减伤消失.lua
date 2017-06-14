---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/肃列_盾墙减伤消失.lua
-- 更新时间:	2014/10/9 21:34:40
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.DelGroupBuff(8265, 1) --免控
	--player.DelGroupBuff(8299, 1) -- 减速
	--player.DelGroupBuff(8300, 1) --减伤
	for i = 1, 4 do
		player.DelBuff(8265, i) --免空
		player.DelBuff(8299, i) --移动速度
	end
	
	--奇穴肃列盾墙效果消失后的减伤
	if player.GetSkillLevel(13181) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 8302, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com