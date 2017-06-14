---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Default.lua
-- 更新时间:	2015/7/29 14:31:27
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local playertarget = GetPlayer(nCharacterID)
	if playertarget then
		playertarget.SetDynamicSkillGroup(0)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com