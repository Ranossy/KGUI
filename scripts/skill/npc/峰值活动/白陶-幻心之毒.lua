---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/峰值活动/白陶-幻心之毒.lua
-- 更新时间:	2015/9/9 20:28:16
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if player then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FullScreenWarning.Open", 5000, "green")
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com