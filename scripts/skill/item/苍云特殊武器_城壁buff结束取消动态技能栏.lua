---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_城壁buff结束取消动态技能栏.lua
-- 更新时间:	2016/3/25 10:24:40
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.DoAction(0, 60124)
	player.SetDynamicSkillGroup(0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com