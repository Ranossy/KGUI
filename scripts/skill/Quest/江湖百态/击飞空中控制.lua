---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/击飞空中控制.lua
-- 更新时间:	2016/7/13 15:56:55
-- 更新用户:	wangsongtao-pc
-- 脚本说明:
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(10851, 1)
	if not buff then
		return
	end
	if buff.nLeftActiveCount == 11 then
		player.Stop()
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com