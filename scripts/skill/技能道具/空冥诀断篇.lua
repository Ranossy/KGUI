---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/空冥诀断篇.lua
-- 更新时间:	08/24/10 15:29:28
-- 更新用户:	zhengkaifeng
-- 脚本说明:	白菜岛，三无城？白帝三才一相逢，策划测试若比邻。浩气恶人意相通，便浮现JQ无数！
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

-- 场景事件, 当地图加载初始化的时候触发一次
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	
	if player.nLevel >= 80 then
		player.SendSystemMessage(GetEditorString(1, 9185))
		return false, false
	end
	
	if player.GetBuff(2129, 1) then
		player.SendSystemMessage(GetEditorString(1, 9186))
		return false, false
	else
		player.AddBuff(0, 99, 2129, 1)
		return false, true
	end
	-- 必须要有两个返回值来确定: 1] 是否继续使用道具自带技能 2] 是否销毁此道具
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com