------------------------------------------------
-- 文件名    :  隐元修行丸.lua
-- 创建人    :  CBG	
-- 创建时间  :  2009-10-12
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  解包真强
------------------------------------------------
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.AddTrainNoLimit(500)
	player.AddBuff(0,99,1435,1)
	-- 必须要有两个返回值来确定: 1] 是否继续使用道具自带技能 2] 是否销毁此道具
	return false, true
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com