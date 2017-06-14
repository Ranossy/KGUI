---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/战乱枫华谷_变身狼牙.lua
-- 更新时间:	2016/10/20 11:40:15
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
    player.DelBuff(2587, 1)	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com