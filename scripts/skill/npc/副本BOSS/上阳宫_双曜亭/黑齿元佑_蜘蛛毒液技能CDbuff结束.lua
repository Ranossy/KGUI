---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_双曜亭/黑齿元佑_蜘蛛毒液技能CDbuff结束.lua
-- 更新时间:	2016/3/31 14:29:56
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	
	npc.FireAIEvent(2001, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com